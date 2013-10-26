module Ted
  class Content
    attr_accessor :attributes, :markup

    include XmlDoc

    def initialize
      @attributes = XmlDoc::ATTRIBUTES
      @markup = Builder::XmlMarkup.new(indent: 0)
      markup.instruct! :xml, encoding: 'UTF-8'
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

    def document_content(&block)
      if block_given?
        markup.office(:'document-content', attributes) { |dc| yield dc }
      else
        markup.office(:'document-content', attributes)
      end
    end

    def font_face(xml, index)
      xml.style(:'font-face', font_face_attrs[index])
    end

    def style(xml, index)
      xml.style(:style, style_attrs[index]) { |ss| style_table(ss, index) }
    end

    def style_table(xml, index)
      xml.style(style_table_tags[index], style_table_attrs[index])
    end

    def add_font_faces_to(xml)
      font_face_attrs.size.times { |i| font_face(xml, i) }
    end

    def add_styles_to(xml)
      style_attrs.size.times { |i| style(xml, i) }
    end

    def add_spreadsheet_to(xml)
      xml.office(:spreadsheet) { |s| add_table_to(s) }
    end

    def add_table_to(xml)
      xml.table(:table, table_attrs) do |tt|
        add_table_column(tt)
        add_table_row(tt)
      end
    end

    def add_table_column(xml)
      xml.table(:'table-column', table_column_attrs)
    end

    def add_table_row(xml)
      xml.table(:'table-row', table_row_attrs) do |tr|
        3.times { add_table_cell(tr, :string) }
      end
    end

    def add_table_cell(xml, type)
      xml.table(:'table-cell', 'office:value-type' => type) do |tc|
        tc.text(:p) { |t| 'a header' }
      end
    end
  end
end
