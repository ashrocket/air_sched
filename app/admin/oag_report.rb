ActiveAdmin.register OagReport do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  index do
          column 'Mail Id' do |report|
            report.msg_id
          end
          column 'Report Key' do |report|
            report.report_key
          end
          column 'Finished'  do |report|
            report.complete
          end
          column 'Status' do |report|
            report.report_status
          end
          column 'Modified' do |report|
            report.updated_at
          end
          column 'Message Data' do |report|
            report.received
          end

     end

end
