module Ted
  class Sheet
    attr_accessor :name, :options, :headers, :rows

    def initialize(name, options = {})
      @name = name
      @options = options
      @headers = {}
      @rows = []
      fetch_headers
    end

    def columns
      ('a'..'amj').map(&:to_sym)
    end

    def insert(data)
      rows << blank_row.merge(data)
    end

  private

    def fetch_headers
      (columns & options.keys).map { |k| headers[k] = options[k] }
    end

    def blank_row
      headers.values.map.with_object({}) { |v, row| row[v[:id]] = '' }
    end
  end
end
