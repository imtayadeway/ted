module Ted
  class Book
    attr_accessor :filename

    def initialize(filename)
      @filename = filename
    end

    def build(filename)
      initialize(filename)
    end

    def sheets
      @sheets ||= Ted::Sheets.new
    end

    def save
      #
    end
  end
end
