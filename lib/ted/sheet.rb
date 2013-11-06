module Ted
  class Sheet
    attr_accessor :name, :options, :headers, :rows

    def initialize(name, options = {})
      @name = name
      @options = options
      @headers = {}
      fetch_headers
      @rows = [header_row]
    end

    def columns
      ('a'..'amj').map(&:to_sym)
    end

    def column(c)
      rows.map { |r| r[headers[c][:id]] }.drop(1)
    end

    def row(n)
      rows[n - 1]
    end

    def insert(data)
      rows << blank_row.merge(data)
    end

    def header_row
      headers.each_value.with_object({}) { |v, row| row[v[:id]] = v[:name] }
    end

  private

    def fetch_headers
      (columns & options.keys).map { |k| headers[k] = options[k] }
    end

    def blank_row
      headers.each_value.with_object({}) { |v, row| row[v[:id]] = '' }
    end
  end
end
