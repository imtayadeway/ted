module Xml
  class Styles < XmlDoc
    def content
      xml.office(:'document-styles', document_styles_attrs) do
        xml.office(:'font-face-decls') { add_font_faces }
        xml.office(:styles) do
          styles
        end

        xml.office(:'automatic-styles') do
          automatic_styles
        end

        xml.office(:'master-styles') do
          master_styles
        end
      end
    end

    def name
      'styles'
    end

  private

    def styles
      xml.style(:'default-style', default_style_attrs) do
        xml.style(:'paragraph-properties', 'style:tab-stop-distance' => "0.5in")
        xml.style(:'text-properties', text_properties_attrs)
      end

      xml.number(:'number-style', :'style:name' => "N0") do
        xml.number(:number, :'number:min-integer-digits' => "1")
      end

      xml.number(:'currency-style', :'style:name' => "N104P0", :'style:volatile' => "true") do
        xml.number(:'currency-symbol', '$', :'number:language' => "en", :'number:country' => "US")
        xml.number(:number, :'number:decimal-places' => "2", :'number:min-integer-digits' => "1", :'number:grouping' => "true")
      end

      xml.number(:'currency-style', :'style:name' => "N104") do
        xml.style(:'text-properties', :'fo:color' => "#ff0000")
        xml.number(:text, '-')
        xml.number(:'currency-symbol', '$', :'number:language' => "en", :'number:country' => "US")
        xml.number(:number, :'number:decimal-places' => "2", :'number:min-integer-digits' => "1", :'number:grouping' => "true")
        xml.style(:nap, :'style:condition' => "value()&gt;=0", :'style:apply-style-name' => "N104P0")
      end

      xml.style(:style, :'style:name' => "Default", :'style:family' => "table-cell") do
        xml.style(:'text-properties', default_text_properties_attrs)
      end

      xml.style(:style, :'style:name' => "Result", :'style:family' => "table-cell", :'style:parent-style-name' => "Default") do
        xml.style(:'text-properties', result_text_properties_attrs)
      end

      xml.style(:style, :'style:name' => "Result2", :'style:family' => "table-cell", :'style:parent-style-name' => "Result", :'style:data-style-name' => "N104")

      xml.style(:style, :'style:name' => "Heading", :'style:family' => "table-cell", :'style:parent-style-name' => "Default") do
        xml.style(:'table-cell-properties', :'style:text-align-source' => 'fix', :'style:repeat-content' => 'false')
        xml.style(:'paragraph-properties', :'fo:text-align' => 'center')
        xml.style(:'text-properties', :'fo:font-size' => '16pt', :'fo:font-style' => 'italic', :'fo:font-weight' => 'bold')
      end

      xml.style(:style, :'style:name' => "Heading1", :'style:family' => "table-cell", :'style:parent-style-name' => "Heading") do
        xml.style(:'table-cell-properties', :'style:rotation-angle' => '90')
      end
    end

    def master_styles
      xml.style(:'master-page', :'style:name' => 'Default', :'style:page-layout-name' => 'Mpm1') do
        xml.style(:header) do
          xml.text(:p) do
            xml.text(:'sheet-name', '???')
          end
        end

        xml.style(:'header-left', :'style:display' => 'false')

        xml.style(:footer) do
          xml.text(:p) do
            xml.text! 'Page '
            xml.text(:'page-number', '1')
          end
        end

        xml.style(:'footer-left', :'style:display' => 'false')
      end

      xml.style(:'master-page', :'style:name' => 'Report', :'style:page-layout-name' => 'Mpm2') do
        xml.style(:header) do
          xml.style(:'region-left') do
            xml.text(:p) do
              xml.text(:'sheet-name', '???')
              xml.text! ' ('
              xml.text(:title, '???')
              xml.text!  ')'
            end
          end

          xml.style(:'region-right') do
            xml.text(:p) do
              # TODO: needs date today
              xml.text(:date, '00/00/0000', :'style:data-style-name' => 'N2', :'text:date-value' => "2013-11-03")
              xml.text! ', '
              xml.text(:time, '00:00:00')
            end
          end
        end

        xml.style(:'header-left', :'style:display' => 'false')

        xml.style(:footer) do
          xml.text(:p) do
            xml.text! 'Page '
            xml.text(:'page-number', '1')
            xml.text! ' / '
            xml.text(:'page-count', '99')
          end
        end

        xml.style(:'footer-left', :'style:display' => 'false')
      end
    end

    def automatic_styles
      xml.style(:'page-layout', :'style:name' => 'Mpm1') do
        xml.style(:'page-layout-properties', :'style:writing-mode' => 'lr-tb')
        xml.style(:'header-style') do
          xml.style(:'header-footer-properties', :'fo:min-height' => '0.2953in', :'fo:margin-left' => '0in', :'fo:margin-right' => '0in', :'fo:margin-bottom' => '0.0984in')
        end

        xml.style(:'footer-style') do
          xml.style(:'header-footer-properties', :'fo:min-height' => '0.2953in', :'fo:margin-left' => '0in', :'fo:margin-right' => '0in', :'fo:margin-top' => '0.0984in')
        end
      end

      xml.style(:'page-layout', :'style:name' => 'Mpm2') do
        xml.style(:'page-layout-properties', :'style:writing-mode' => 'lr-tb')
        xml.style(:'header-style') do
          xml.style(:'header-footer-properties', :'fo:min-height' => '0.2953in', :'fo:margin-left' => '0in', :'fo:margin-right' => '0in', :'fo:margin-bottom' => '0.0984in', :'fo:border' => '2.49pt solid #000000', :'fo:padding' => '0.0071in', :'fo:background-color' => '#c0c0c0') do
            xml.style(:'background-image')
          end
        end

        xml.style(:'footer-style') do
          xml.style(:'header-footer-properties', :'fo:min-height' => '0.2953in', :'fo:margin-left' => '0in', :'fo:margin-right' => '0in', :'fo:margin-top' => '0.0984in', :'fo:border' => '2.49pt solid #000000', :'fo:padding' => '0.0071in', :'fo:background-color' => '#c0c0c0') do
            xml.style(:'background-image')
          end
        end
      end
    end

    def text_properties_attrs
      config[:text_properties_attrs]
    end

    def document_styles_attrs
      config[:document_styles_attrs]
    end

    def default_style_attrs
      config[:default_style_attrs]
    end

    def default_text_properties_attrs
      config[:default_text_properties_attrs]
    end

    def result_text_properties_attrs
      config[:result_text_properties_attrs]
    end
  end
end
