require 'yaml'

module ZipCodes
  VERSION = '0.2.1'

  class << self
    def identify(code)
      if ('A'..'Z').include?(code[0].upcase)
        ca_db[code[0..2].upcase]
      else
        db[code]
      end
    end

    def db
      @db ||= begin
        this_file = File.expand_path(File.dirname(__FILE__))
        us_data = File.join(this_file, 'data', 'US.yml')
        YAML.load(File.open(us_data))
      end
    end

    def db
      @db ||= begin
        this_file = File.expand_path(File.dirname(__FILE__))
        ca_data = File.join(this_file, 'data', 'CA.yml')
        YAML.load(File.open(ca_data))
      end
    end

    def load
      db
    end
  end
end
