module Xml
  class Settings < XmlDoc
    def content
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

    def name
      'settings'
    end

  private

    def document_settings_attrs
      config[:document_settings_attrs]
    end

    def config_item_set_attrs
      config[:config_item_set_attrs]
    end

    def visible_area_top_attrs
      config[:visible_area_top_attrs]
    end

    def visible_area_left_attrs
      config[:visible_area_left_attrs]
    end

    def visible_area_width_attrs
      config[:visible_area_width_attrs]
    end

    def visible_area_height_attrs
      config[:visible_area_height_attrs]
    end
  end
end
