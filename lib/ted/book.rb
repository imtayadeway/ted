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
      @sheets = []
    end

    def add_sheet(options = {})
      sheets << Ted::Sheet.new(options.delete(:name) || new_sheetname, options)
      sheets.last
    end
    
    def sheetnames
      sheets.map(&:name)
    end

    def save
      File.new("#{ filename }.ods", 'w')
    end
    
  private
    
    def new_sheetname
      return 'Sheet 1' unless sheetnames.include?('Sheet 1')
      'Sheet 2'
    end
  end
end
