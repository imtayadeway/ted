module Ted
  class Content
    attr_accessor :markup, :book

    include XmlDoc

    def initialize
      @markup = Builder::XmlMarkup.new(indent: 0)
      markup.instruct! :xml, encoding: 'UTF-8'
    end

    def generate
      document_content do |dc|
        dc.office(:scripts)
        dc.office(:'font-face-decls') { |ffd| add_font_faces_to(ffd) }
        dc.office(:'automatic-styles') { |as| add_styles_to(as) }
        dc.office(:body) do |body|
          add_spreadsheet_to(body) do |s|
            add_table_to(s) do |tt|
              add_table_column(tt)
              add_table_row(tt)
            end
          end
        end
      end
    end

  private

    def document_content(&block)
      markup.office(:'document-content', document_content_attrs, &block)
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

    def add_spreadsheet_to(xml, &block)
      xml.office(:spreadsheet, &block)
    end

    def add_table_to(xml, &block)
      xml.table(:table, table_attrs, &block)
    end

    def add_table_column(xml)
      xml.table(:'table-column', table_column_attrs)
    end

    def add_table_row(xml)
      xml.table(:'table-row', table_row_attrs) do |tr|
        3.times { add_table_cell(tr, :string) } # or float, etc...
      end
    end

    def add_table_cell(xml, type)
      xml.table(:'table-cell', 'office:value-type' => type) do |tc|
        tc.text(:p) { |t| 'a header' } # --> add the cell content
      end
    end
  end
end
