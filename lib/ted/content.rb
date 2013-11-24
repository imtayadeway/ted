module Ted
  class Content < XmlDoc
    attr_accessor :book, :rows

    def initialize(rows = [])
      super()
      @rows = rows
    end

    def generate
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

    # TODO: factor this out to remove code duplication?
    def document_content_attrs
      {
        :'xmlns:office'       => "urn:oasis:names:tc:opendocument:xmlns:office:1.0",
        :'xmlns:table'        => "urn:oasis:names:tc:opendocument:xmlns:table:1.0",
        :'xmlns:draw'         => "urn:oasis:names:tc:opendocument:xmlns:drawing:1.0",
        :'xmlns:fo'           => "urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0",
        :'xmlns:xlink'        => "http://www.w3.org/1999/xlink",
        :'xmlns:dc'           => "http://purl.org/dc/elements/1.1/",
        :'xmlns:meta'         => "urn:oasis:names:tc:opendocument:xmlns:meta:1.0",
        :'xmlns:number'       => "urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0",
        :'xmlns:presentation' => "urn:oasis:names:tc:opendocument:xmlns:presentation:1.0",
        :'xmlns:svg'          => "urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0",
        :'xmlns:chart'        => "urn:oasis:names:tc:opendocument:xmlns:chart:1.0",
        :'xmlns:dr3d'         => "urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0",
        :'xmlns:math'         => "http://www.w3.org/1998/Math/MathML",
        :'xmlns:form'         => "urn:oasis:names:tc:opendocument:xmlns:form:1.0",
        :'xmlns:script'       => "urn:oasis:names:tc:opendocument:xmlns:script:1.0",
        :'xmlns:ooo'          => "http://openoffice.org/2004/office",
        :'xmlns:ooow'         => "http://openoffice.org/2004/writer",
        :'xmlns:oooc'         => "http://openoffice.org/2004/calc",
        :'xmlns:dom'          => "http://www.w3.org/2001/xml-events",
        :'xmlns:xforms'       => "http://www.w3.org/2002/xforms",
        :'xmlns:xsd'          => "http://www.w3.org/2001/XMLSchema",
        :'xmlns:xsi'          => "http://www.w3.org/2001/XMLSchema-instance",
        :'xmlns:rpt'          => "http://openoffice.org/2005/report",
        :'xmlns:of'           => "urn:oasis:names:tc:opendocument:xmlns:of:1.2",
        :'xmlns:xhtml'        => "http://www.w3.org/1999/xhtml",
        :'xmlns:grddl'        => "http://www.w3.org/2003/g/data-view#",
        :'xmlns:tableooo'     => "http://openoffice.org/2009/table",
        :'xmlns:field'        => "urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0",
        :'xmlns:formx'        => "urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0",
        :'xmlns:css3t'        => "http://www.w3.org/TR/css3-text/",
        :'office:version'     => "1.2"
      }
    end

    def style_attrs
      [
        {
          :'style:name'   => "co1",
          :'style:family' => "table-column"
        },

        {
          :'style:name'   => "ro1",
          :'style:family' => "table-row"
        },

        {
          :'style:name'             => "ta1",
          :'style:family'           => "table",
          :'style:master-page-name' => "Default"
        }
      ]
    end

    def style_table_attrs
      [
        {
          :'fo:break-before'    => "auto",
          :'style:column-width' => "0.889in"
        },

        {
          :'style:row-height'             => "0.1827in",
          :'fo:break-before'              => "auto",
          :'style:use-optimal-row-height' => "true"
        },

        {
          :'table:display'      => "true",
          :'style:writing-mode' => "lr-tb"
        }
      ]
    end

    def table_attrs
      {
        :'table:name'       => "Sheet1",
        :'table:style-name' => "ta1"
      }
    end

    def table_column_attrs
      {
        :'table:style-name'              => "co1",
        :'table:number-columns-repeated' => "3",
        :'table:default-cell-style-name' => "Default"
      }
    end

    def table_row_attrs
      {:'table:style-name' => "ro1" }
    end

    def style_table_tags
      [
        :'style:table-column-properties',
        :'style:table-row-properties',
        :'style:table-properties'
      ]
    end
  end
end
