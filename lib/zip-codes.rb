require 'yaml'

module ZipCodes
  VERSION = '0.2.1'

  class << self
    def identify(code)
      if ('A'..'Z').to_a.include?(code[0].upcase)
        db[code[0..2].upcase]
      else
        db[code]
      end
    end

    def db
      @db ||= begin
        this_file = File.expand_path(File.dirname(__FILE__))
        all_data = File.join(this_file, 'data', 'USCA.yml')
        YAML.load(File.open(all_data))
      end
    end

    def load
      db
    end
  end
end
