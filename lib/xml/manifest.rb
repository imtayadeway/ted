module Xml
  class Manifest < XmlDoc
    def content
      xml.manifest(:manifest, manifest_attrs) do
        file_entry_attrs.each do |attrs_method|
          xml.manifest(:'file-entry', send(attrs_method))
        end
      end
    end

    def name
      'manifest'
    end

    def full_name
      'META-INF' + '/' + name + '.xml'
    end

  private

    def file_entry_attrs
      private_methods(false).drop(2)
    end

    def manifest_attrs
      config[:manifest_attrs]
    end

    def base_path_attrs
      config[:base_path_attrs]
    end

    def meta_path_attrs
      config[:meta_path_attrs]
    end

    def settings_path_attrs
      config[:settings_path_attrs]
    end

    def content_path_attrs
      config[:content_path_attrs]
    end

    def thumbnails_path_attrs
      config[:thumbnails_path_attrs]
    end

    def manifest_path_attrs
      config[:manifest_path_attrs]
    end

    def accellerator_path_attrs
      config[:accellerator_path_attrs]
    end

    def configuration_path_attrs
      config[:configuration_path_attrs]
    end

    def styles_path_attrs
      config[:styles_path_attrs]
    end
  end
end
