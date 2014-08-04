module Ted
  class Sheet
    def initialize(name, headers)
      @name = name
      @headers = headers
      @data = [header_row]
    end

    def rows
      1.upto(data.map(&:row).max).to_a
    end

    def columns
      'a'.upto(headers.max.column.to_s).map(&:to_sym)
    end

    def column(column)
      rows.map { |n| find_cell(column, n) || Cell.new(column, n, '') }
    end

    def row(n)
      columns.map { |column| find_cell(column, n) || Cell.new(column, n, '') }
    end

    def insert(row)
      row_number = rows.last + 1
      row.each_pair do |id, value|
        column = find_header(id).column
        data << Cell.new(column, row_number, value)
      end
    end

    def header_row
      row(1)
    end

    private

    attr_accessor :data, :name, :headers

    def find_cell(column, row)
      data.find { |d| d.row == row && d.column == column }
    end

    def find_header(id)
      headers.find { |h| h.id == id }
    end
  end
end
