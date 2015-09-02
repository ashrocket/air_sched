**README**

This application is dependent upon the open source email fetching gem: mastiff published here:
https://github.com/ashrocket/mastiff

 1. OAG Schedule file generator
 2. Brands
 3. Rails App
 4. Sidekick Workers  
 5. Rake Tasks
 
**OAG Schedule File**
---------------
Use the oag analyser tool to geenrate a schedule file for any report you wish to include in the Brand or ReportKey.


**Brands**
---------------

Brands are able to hold multiple report_keys.
If you want to include more than 1 OAG schedule file in a Route File, simply add the required report_key to the brand.
Currently the most reliable way to add report_keys is to do so the rails console, as the postgres array type has not been implemented in ActiveAdmin, and there is no view defined to edit Brands directly.
**example**

    ashr-mac:air_sched $rails c
    2.1.2 :001 > b = Brand.keyed('TZ')
      Brand Load (1.2ms)  SELECT  "brands".* FROM "brands" WHERE "brands"."brand_key" = $1  ORDER BY "brands"."id" ASC LIMIT 1  [["brand_key", "TZ"]]
     => #<Brand id: 1, brand_key: "TZ", name: "Scoot", report_keys: ["TZTRDDXW", "TZBRANDVA"], description: "Scoot Interline Network", host_map: {"TZ"=>"TZ", "TR"=>"TZ", "XW"=>"XW", "DD"=>"DD"}, active: true, slug: "tz", created_at: "2015-07-27 23:10:16", updated_at: "2015-08-05 03:49:48", default_currency: "AUD"> 
    2.1.2 :002 > b.report_keys =  ["TZTRDDXW", "TZBRANDVA", "TZBRANDMI"]
     => ["TZTRDDXW", "TZBRANDVA", "TZBRANDMI"] 
    2.1.2 :003 > b.save
       (0.3ms)  BEGIN
      SQL (1.1ms)  UPDATE "brands" SET "report_keys" = $1, "updated_at" = $2 WHERE "brands"."id" = $3  [["report_keys", "{TZTRDDXW,TZBRANDVA,TZBRANDMI}"], ["updated_at", "2015-08-05 14:05:04.382883"], ["id", 1]]
       (385.4ms)  COMMIT
     => true 
    2.1.2 :004 > 

----------
**Rails App**
---------------

The Rails App that allows for basic schedule combination search, 
and allows for configuraiton settings.

Run 

    rake routes

 to see the paths.
 
 
The Rails Application uses ActiveAdmin as its primary admin environemtn
https://github.com/activeadmin/activeadmin


**Sidekiq Workers**
---------------

The sidekiq workers can be launched by issuing the command

    sidekiq -C config/sidekiq.yml

The configuration currently includes different named queues for different worker types, up to 50 threads, and a sidekiq specific log file.

    :concurrency: 50
    :queues:
      - default
      - email_queue
      - report_queue
      - export_queue
    :logfile: log/air_sched_sidekiq.log

The workers progress in the following order

Several workers need to be overridden for Mastiff to work.  These are the Mastiff Workers:

**mastiff workers**
---------------
In the mastiff initlaizer `config/mastiff.rb`  you'll need to set these worker values to the workers you include in the air_sched app.  These are currently already defines below.

**app/workers/sync_mail_worker.rb**

This worker runs periodically according to what is set in the side_tiq directive: `  recurrence { minutely(5) }`  This worker opens the inbox and looks for new emails, and only processes the latest email with a given subject line.  It then calls SyncAttachementWorker on each mail.

**app/workers/sync_attachment_worker.rb**

     *# config/mastiff.rb*
      Worker to decode and store attachments
      config.sync_attachment_worker = SyncAttachmentWorker

Worker Creates an OAGReport object (which is a record of the email attachment downloading and process) and sets intial state.  
Then calls sync attachemtn on the message object (a Mastiff Class), if the attachement is successfully download to a temp directory, the message object will call what ever has been set at this config value to 'process' the attachment where `id` is the mailbox message id.

    Mastiff.process_attachment_worker.perform_async(id)

**app/workers/sync_attachment_worker.rb**

       # config/mastiff.rb*
       # Worker to process attachments and perform an action
      config.process_attachment_worker  = ProcessAttachmentWorker

     # Class to store attachment
      config.attachment_uploader        =  MailAttachmentUploader
    
      config.attachment_dir      = "data/attachments/pending"

  This worker also requires an AttachmentUploader to be defined as well as an attachment folder to be defined.  Current design uses CarrierWave, and a custom uploader class to accomplish storing the schedule file locally. The worker checks in the ReportKey model to see if a reportkey has been define with a file pattern that matches the file name.  For example if the schedule filename is `cxxtz_121241412.csv` and there is a ReportKey object with a filepattern `/cxx(tz)_\d+/` then whatever the ReportKey.key attribute of the ReportObject will be used when storing this schedule as it's data_key.  If a successful ReportKey match is acheive, this worker will kickoff the App Level workers, starting with the ScheduleImportWorker

**app level workers**
---------------
These are not schedule workers, but are triggered by a call to perform_async on the worker class.

 # app/workers/schedule_import_worker.rb
 Load the schedule in to the oag_schedule table
creates a new  Oag::Process object, and move the OagReport object through it's state machine calling each of the functions below in sequence when they are complete.

 - processor.import_oag_file(report)
 - processor.refresh_airports(report)
 - UpdateAirportsWorker.perform_async()
 - processor.refresh_airlines(report)
 - processor.refresh_direct_flights(report)
 - processor.refresh_destinations(report)
 - FilterDestinationsWorker.perform_async(report_id)
 - processor.refresh_cnx_pairs(report)
 - processor.finalize(report, 'processed')

`Processor.finalize` moves the email to the processed mailbox and deletes the local attachment.
 
----------
There are 3 rake tasks that can be used to build route map files.


    rake reports:build_connections
    rake reports:build_market_route_maps  
    rake reports:build_market_smart_routes 


**

build_connections
-----------------
This task links all the schedules for a given Brand.
build connections will use Effective and Discontinue dates to match every possible schedule included in the multiple schedule files defined for the brand.  This can take several hours to complete depending upon how many carriers you have defined in the Brand.

build_market_smart_routes
-----------------
This task iterates through all the BrandConnections for a given brand and generates the 1 segment, two segment and three segment possbile combinations.  The 3 segment combination routine simply overlays BrandConnections that share a beginning and ending segment.  In this way you can layer as many segments as you need by just iterating through this logic.  `build_brand_market_routes(brand, segment_count)`

build_market_route_maps
-----------------
This task generates a JSON file for the Brand based on the specified entities in the market_smart_routes task.    Each brand's smart market routes are defined in the BrandedMarketSegmentsRequest model 
**

----------


* Infrastructure
Compatible with ruby-2.1.2 MRI

* Database creation
* Database uses postgres, and takes advantage of postgres array types and JSON types.  This will require using textarea for these types in ActiveAdmin, or to include one of the many rendering libraries that help to render Postgress JSON/Array types in active admin.
For example :
http://database.javascriptag.com/180_20737043/


* Mastiff Initilialization

mastiff gem requires mailbox credentials to be supplied either in Environment variables or in application.yml

    MASTIFF_EMAIL_ADDRESS: email address for the reports
    MASTIFF_PORT:  address port number (IMAP ONLY)
    MASTIFF_PASSWORD: account password
    MASTIFF_MAILHOST: mailhost address

----------

Application.yml
-----------------

Add configuration values here, as shown below.

     #
     #
     #stripe_api_key: sk_test_2J0l093xOyW72XUYJHE4Dv2r
     # stripe_publishable_key: pk_test_ro9jV5SNwGb1yYlQfzG17LHK
     #
     #  You can specify by environment
     # production:
     #   stripe_api_key: sk_live_EeHnL644i6zo4Iyq4v1KdV9H
     #   stripe_publishable_key: pk_live_9lcthxpSIHbGwmdO941O1XVU
     # 
    market_bucket_name: airblackbox-markets
    routes_bucket_name: airblackbox-routes
    s3_region: us-east-1
    abb_aws_access_key_id: SECRETKEYID
    abb_aws_secret_access_key: SECRETKEY
    MASTIFF_EMAIL_ADDRESS: email@email.com
    MASTIFF_PORT: '993'
    MASTIFF_PASSWORD: EMAILPASSWORD
    MASTIFF_MAILHOST: subhost.mail.mailhost.com

**DATABSED REBUILD**

    pg_dump -c dbname=air_sched_development -t report_keys -t brand_report_keys -t brands -f brands_report_keys.sql
    psql -f brands_report_keys.sql -d your_db_name 

    pg_dump --data-only dbname=air_sched_development  -t airports  -t airport_currencies  -t airlines -t airlines_hosts -t hosts  -t interline_cxr_rules -f seed_starter_data.sql
    psql -f seed_starter_data.sql -d your_db_name

These files are already in the db folder.

**TODOs**

 1. Update Schedule Importer to use a fast upsert methodology so schedule_ids don't need to be destroyed if they haven't changed.  Most likely a Blob Checksum, or a diff_set.
 2. Update BrandedConnection builder and later states to check against existing datasets and only update changes.
 3. Add realtime log viewing to Admin Console
 4. Refactor Import StateMachine to a real state machine
 5. Implement RouteMap Exporter as a statemachine
 

