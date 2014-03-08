module Ted
  class Content < XmlDoc
    attr_accessor :book, :rows

    def initialize(rows = [])
      super()
      @rows = rows
    end

    def content
      xml.office(:'document-content', document_content_attrs) do
        xml.office(:scripts)
        xml.office(:'font-face-decls') { add_font_faces }
        xml.office(:'automatic-styles') { add_styles }
        xml.office(:body) do
          xml.office(:spreadsheet) do
            xml.table(:table, table_attrs) do
              xml.table(:'table-column', table_column_attrs)

              rows.each do |row|
                xml.table(:'table-row', table_row_attrs) do

                  row.each do |cell|
                    xml.table(:'table-cell', 'office:value-type' => cell.format) do
                      xml.text(:p, cell.content)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    def name
      'content'
    end

  private

    def style(attrs, index)
      xml.style(:style, attrs) { style_table(index) }
    end

    def style_table(index)
      xml.style(style_table_tags[index], style_table_attrs[index])
    end

    # TODO: refactor this to stop passing indexes around
    def add_styles
      style_attrs.each_with_index { |attrs, i| style(attrs, i) }
    end

    def document_content_attrs
      config[:document_content_attrs]
    end

    def style_attrs
      config[:style_attrs]
    end

    def style_table_attrs
      config[:style_table_attrs]
    end

    def table_attrs
      config[:table_attrs]
    end

    def table_column_attrs
      config[:table_column_attrs]
    end

    def table_row_attrs
      config[:table_row_attrs]
    end

    def style_table_tags
      config[:style_table_tags]
    end
  end
end
