module Ted
  class Book
    class << self
      def build(filename)
        new(filename)
      end
    end

    attr_accessor :filename, :sheets

    def initialize(filename)
      @filename = filename
      @sheets = Ted::Sheets.new
    end

    def add_sheet(options = {})
      sheets.add_sheet(options)
    end

    def save
      File.new("#{ filename }.ods", 'w')
    end
  end
end
