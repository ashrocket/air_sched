require 'roo'
class Airline < ActiveRecord::Base
  # :code
  # :name
  # :country
  extend FriendlyId
  friendly_id :code, use: :slugged


  class << self
    def by_code code
      find_by(:code => code)
    end

    def source_file
      fp  = File.join Rails.root, "data", "oag", "airlines", 'oag_airlines.xls'
      fzp = File.join Rails.root, "data", "oag", "airlines", 'oag_airlines.xls.zip'
      File.exist?(fp) ? fp : ''
    end

    def load_rows

      fn = source_file
      if fn
            xls = Roo::Spreadsheet.open(fn)
            rows = xls.parse(:header_search => ['IATA','Eff\sTo$'])
            rows.shift
            rows.pop(3)
            rows.delete_if{|row| row["Eff To"] < Date.today}
      end
      rows || []
    end

    def load_from_file
      rows = load_rows
      unless rows.blank?
        Airline.delete_all
        rows.each do |airline|
          Airline.create code: airline["IATA"], name: airline["Airline Name"].strip, country: airline["Country Name"].strip
        end

      end
    end
    def update_from_file
      rows = load_rows
      unless rows.blank?
        rows.each do |airline|
          cxr = Airline.find_or_create_by(code: airline["IATA"])
          cxr.update name: airline["Airline Name"].strip, country: airline["Country Name"].strip
          cxr.save
        end
      end
    end

    def refresh_from_hub hub
       carriers = OagSchedule.hub(hub).pluck(:airline_code, :airline_name).uniq
       carriers.each do |carrier|
         cxr = where(code: carrier[0]).first_or_create!
         cxr.name = carrier[1]
         cxr.save
       end

    end
    def refresh_from_cxx cxx
       carriers = OagSchedule.cxr(cxx).pluck(:airline_code, :airline_name).uniq
       carriers.each do |carrier|
         cxr = where(code: carrier[0]).first_or_create!
         cxr.name = carrier[1]
         cxr.save
       end
    end

    def cached code
      Rails.cache.fetch("airline_name_#{code}", :expires_in => 1.hour) do
         by_code(code).first
       end
    end

    def cached_name code
      airline =  cached(code)
      name = airline ? airline.name : 'Unknown Airline Name'
    end

  end

  #----------------------
  # Instance Methods
  #----------------------
  def disp_airline
     "#{self.name} (#{self.code})"
  end





end
