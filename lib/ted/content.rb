module Ted
  class Content
    attr_accessor :attributes, :xml

    include XmlDoc

    def initialize
      @attributes = XmlDoc::ATTRIBUTES
      @xml = Builder::XmlMarkup.new(indent: 0)
      @xml.instruct! :xml, encoding: 'UTF-8'
    end

    def document_content(&block)
      if block_given?
        xml.office(:'document-content', attributes) { |dc| yield dc }
      else
        xml.office(:'document-content', attributes)
      end
    end

    def font_face(content, index)
      content.style(:'font-face', font_face_attrs[index])
    end

    def style(content, index)
      content.style(:style, style_attrs[index]) { |ss| style_table(ss, index) }
    end

    def style_table(content, index)
      content.style(style_table_tags[index], style_table_attrs[index])
    end

    def add_font_faces_to(content)
      font_face_attrs.size.times { |i| font_face(content, i) }
    end

    def add_styles_to(content)
      style_attrs.size.times { |i| style(content, i) }
    end

    def add_spreadsheet_to(content)
      content.office(:spreadsheet) { |s| add_table_to(s) }
    end

    def add_table_to(content)
      content.table(:table, table_attrs) do |tt|
        add_table_column(tt)
        add_table_row(tt)
      end
    end

    def add_table_column(content)
      content.table(:'table-column', table_column_attrs)
    end

    def add_table_row(content)
      content.table(:'table-row', table_row_attrs) do |tr|
        3.times { add_table_cell(tr, :string) }
      end
    end

    def add_table_cell(content, type)
      content.table(:'table-cell', 'office:value-type' => type) do |tc|
        tc.text(:p) { |t| 'a header' }
      end
    end

    def table_attrs
      {'table:name' => "Sheet1", 'table:style-name' => "ta1"}
    end

    def table_column_attrs
      {
        'table:style-name' => "co1",
        'table:number-columns-repeated' => "3",
        'table:default-cell-style-name' => "Default"
      }
    end

    def table_row_attrs
      {'table:style-name' => "ro1" }
    end

    def generate(&block)
      document_content do |dc|
        dc.office(:scripts)
        dc.office(:'font-face-decls') { |ffd| add_font_faces_to(ffd) }
        dc.office(:'automatic-styles') { |as| add_styles_to(as) }
        dc.office(:body) { |body| add_spreadsheet_to(body, &block) }
      end
    end

  private

    def private_method
    end
  end
end
