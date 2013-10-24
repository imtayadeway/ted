module Ted
  module XmlDoc
    ATTRIBUTES = {
      'xmlns:office'       => "urn:oasis:names:tc:opendocument:xmlns:office:1.0",
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
      'xmlns:xforms'       => "http://www.w3.org/2002/xforms",
      'xmlns:xsd'          => "http://www.w3.org/2001/XMLSchema",
      'xmlns:xsi'          => "http://www.w3.org/2001/XMLSchema-instance",
      'xmlns:rpt'          => "http://openoffice.org/2005/report",
      'xmlns:of'           => "urn:oasis:names:tc:opendocument:xmlns:of:1.2",
      'xmlns:xhtml'        => "http://www.w3.org/1999/xhtml",
      'xmlns:grddl'        => "http://www.w3.org/2003/g/data-view#",
      'xmlns:tableooo'     => "http://openoffice.org/2009/table",
      'xmlns:field'        => "urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0",
      'xmlns:formx'        => "urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0",
      'xmlns:css3t'        => "http://www.w3.org/TR/css3-text/",
      'office:version'     => "1.2"
    }

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
          'svg:font-family'           => "&apos;DejaVu Sans&apos;",
          'style:font-family-generic' => "system",
          'style:font-pitch'          => "variable"
        },

        {
          'style:name'                => "Lohit Hindi",
          'svg:font-family'           => "&apos;Lohit Hindi&apos;",
          'style:font-family-generic' => "system",
          'style:font-pitch'          => "variable"
        },

        {
          'style:name'                => "WenQuanYi Zen Hei",
          'svg:font-family'           => "&apos;WenQuanYi Zen Hei&apos;",
          'style:font-family-generic' => "system",
          'style:font-pitch'          => "variable"
        }
      ]
    end

    def style_attrs
      [
        {
          'style:name' => "co1",
          'style:family' => "table-column"
        },

        {
          'style:name' => "ro1",
          'style:family' => "table-row"
        },

        {
          'style:name' => "ta1",
          'style:family' => "table",
          'style:master-page-name' => "Default"
        }
      ]
    end

    def style_table_attrs
      [
        {
          'fo:break-before' => "auto",
          'style:column-width' => "0.889in"
        },

        {
          'style:row-height' => "0.1693in",
          'fo:break-before' => "auto",
          'style:use-optimal-row-height' => "true"
        },

        {
          'table:display' => "true",
          'style:writing-mode' => "lr-tb"
        }
      ]
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
