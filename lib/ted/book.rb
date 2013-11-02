module Ted
  class Book
    class << self
      def build(filename)
        new(filename)
      end
    end

    attr_accessor :filename

    def initialize(filename)
      @filename = filename
    end

    def build(options = {})
      sheets.build(options)
    end

    def sheets
      @sheets ||= Ted::Sheets.new
    end

    def save
      #
    end
  end
end
