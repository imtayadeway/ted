module Ted
  class Cell
    attr_accessor :column, :row, :content

    def initialize(column, row, content)
      @column = column
      @row = row
      @content = content
    end

    def <=>(other)
      [column, row] <=> [other.column, other.row]
    end
  end
end
