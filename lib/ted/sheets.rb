module Ted
  class Sheets
    include Enumerable

    attr_accessor :sheets

    def initialize
      @sheets = []
    end

    def each(&block)
      sheets.each(&block)
    end

    def add_sheet(options = {})
      sheets << Ted::Sheet.new(options.delete(:name) || new_sheetname, options)
      sheets.last
    end

    def sheetnames
      sheets.map(&:name)
    end

  private

    def new_sheetname
      return 'Sheet 1' unless sheetnames.include?('Sheet 1')
      'Sheet 2'
    end
  end
end
