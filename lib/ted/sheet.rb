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

    def fetch_headers
      (columns & options.keys).map { |k| headers[k] = options[k] }
    end

    def next_row
      rows.count + 2
    end

    def next_row_data(data)
      {next_row => populated_row(data)}
    end

    def blank_row
      headers.values.map.with_object({}) { |v, row| row[v[:id]] = '' }
    end

    def populated_row(data)
      blank_row.merge(data)
    end

    def insert(data)
      rows << next_row_data(data)
    end
  end
end
