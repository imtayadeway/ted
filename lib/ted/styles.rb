module Ted
  class Styles < XmlDoc
    def generate
      xml.office(:'document-styles', document_styles_attrs) do
        xml.office(:'font-face-decls') { add_font_faces }
        xml.office(:styles) do
          xml.style(:'default-style', 'style:family' => "table-cell") do
            xml.style(:'paragraph-properties', 'style:tab-stop-distance' => "0.5in")
            xml.style(:'text-properties', text_properties_attrs)
          end
        end
        xml.office(:'automatic-styles') do
        end
        xml.office(:'master-styles') do
        end
      end
    end

  private

    def text_properties_attrs
      {
        'style:font-name'         => "Arial",
        'fo:language'             => "en",
        'fo:country'              => "US",
        'style:font-name-asian'   => "DejaVu Sans",
        'style:language-asian'    => "zh",
        'style:country-asian'     => "CN",
        'style:font-name-complex' => "DejaVu Sans",
        'style:language-complex'  => "hi",
        'style:country-complex'   => "IN"
      }
    end

    # TODO: code duplication from content - extract out?
    def add_font_faces
      font_face_attrs.each { |attrs| font_face(attrs) }
    end

    def font_face(attrs)
      xml.style(:'font-face', attrs)
    end

    def font_face_attrs
      [
        {
          'style:name'                => "Arial",
          'svg:font-family'           => "Arial",
          'style:font-family-generic' => "swiss",
          'style:font-pitch'          => "variable"
        },

        {
          'style:name'                => "DejaVu Sans",
          'svg:font-family'           => "DejaVu Sans",
          'style:font-family-generic' => "system",
          'style:font-pitch'          => "variable"
        },

        {
          'style:name'                => "Lohit Hindi",
          'svg:font-family'           => "'Lohit Hindi'",
          'style:font-family-generic' => "system",
          'style:font-pitch'          => "variable"
        },

        {
          'style:name'                => "WenQuanYi Zen Hei",
          'svg:font-family'           => "'WenQuanYi Zen Hei'",
          'style:font-family-generic' => "system",
          'style:font-pitch'          => "variable"
        }
      ]
    end

    def document_styles_attrs
      {
        'xmlns:office'       => "urn:oasis:names:tc:opendocument:xmlns:office:1.0",
        'xmlns:style'        => "urn:oasis:names:tc:opendocument:xmlns:style:1.0",
        'xmlns:text'         => "urn:oasis:names:tc:opendocument:xmlns:text:1.0",
        'xmlns:table'        => "urn:oasis:names:tc:opendocument:xmlns:table:1.0",
        'xmlns:draw'         => "urn:oasis:names:tc:opendocument:xmlns:drawing:1.0",
        'xmlns:fo'           => "urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0",
        'xmlns:xlink'        => "http://www.w3.org/1999/xlink",
        'xmlns:dc'           => "http://purl.org/dc/elements/1.1/",
        'xmlns:meta'         => "urn:oasis:names:tc:opendocument:xmlns:meta:1.0",
        'xmlns:number'       => "urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0",
        'xmlns:presentation' => "urn:oasis:names:tc:opendocument:xmlns:presentation:1.0",
        'xmlns:svg'          => "urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0",
        'xmlns:chart'        => "urn:oasis:names:tc:opendocument:xmlns:chart:1.0",
        'xmlns:dr3d'         => "urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0",
        'xmlns:math'         => "http://www.w3.org/1998/Math/MathML",
        'xmlns:form'         => "urn:oasis:names:tc:opendocument:xmlns:form:1.0",
        'xmlns:script'       => "urn:oasis:names:tc:opendocument:xmlns:script:1.0",
        'xmlns:ooo'          => "http://openoffice.org/2004/office",
        'xmlns:ooow'         => "http://openoffice.org/2004/writer",
        'xmlns:oooc'         => "http://openoffice.org/2004/calc",
        'xmlns:dom'          => "http://www.w3.org/2001/xml-events",
        'xmlns:rpt'          => "http://openoffice.org/2005/report",
        'xmlns:of'           => "urn:oasis:names:tc:opendocument:xmlns:of:1.2",
        'xmlns:xhtml'        => "http://www.w3.org/1999/xhtml",
        'xmlns:grddl'        => "http://www.w3.org/2003/g/data-view#",
        'xmlns:tableooo'     => "http://openoffice.org/2009/table",
        'xmlns:drawooo'      => "http://openoffice.org/2010/draw",
        'xmlns:calcext'      => "urn:org:documentfoundation:names:experimental:calc:xmlns:calcext:1.0",
        'xmlns:css3t'        => "http://www.w3.org/TR/css3-text/",
        'office:version'     => "1.2"
      }
    end
  end
end
