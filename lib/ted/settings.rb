module Ted
  class Settings < XmlDoc
    def generate
      xml.office(:'document-settings', document_settings_attrs) do
        xml.office(:settings) do
          xml.config(:'config-item-set', config_item_set_attrs) do
            xml.config(:'config-item', visible_area_top_attrs, 0)
            xml.config(:'config-item', visible_area_left_attrs, 0)
            xml.config(:'config-item', visible_area_width_attrs, 2257)
            xml.config(:'config-item', visible_area_height_attrs, 463)
          end
        end
      end
    end

  private

    def document_settings_attrs
      {
        :'xmlns:office'   => "urn:oasis:names:tc:opendocument:xmlns:office:1.0",
        :'xmlns:xlink'    => "http://www.w3.org/1999/xlink",
        :'xmlns:config'   => "urn:oasis:names:tc:opendocument:xmlns:config:1.0",
        :'xmlns:ooo'      => "http://openoffice.org/2004/office",
        :'office:version' => "1.2"
      }
    end

    def config_item_set_attrs
      { :'config:name' => "ooo:view-settings" }
    end

    def visible_area_top_attrs
      {
        :'config:name' => "VisibleAreaTop",
        :'config:type' => "int"
      }
    end

    def visible_area_left_attrs
      {
        :'config:name' => "VisibleAreaLeft",
        :'config:type' => "int"
      }
    end

    def visible_area_width_attrs
      {
        :'config:name' => "VisibleAreaWidth",
        :'config:type' => "int"
      }
    end

    def visible_area_height_attrs
      {
        :'config:name' => "VisibleAreaLHeight",
        :'config:type' => "int"
      }
    end
  end
end
