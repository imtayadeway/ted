module Ted
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

  private

    def file_entry_attrs
      private_methods(false).drop(2)
    end

    def manifest_attrs
      {
        :'xmlns:manifest' => "urn:oasis:names:tc:opendocument:xmlns:manifest:1.0",
        :'manifest:version' => "1.2"
      }
    end

    def base_path_attrs
      {
        :'manifest:full-path' => "/",
        :'manifest:version' => "1.2",
        :'manifest:media-type' => "application/vnd.oasis.opendocument.spreadsheet"
      }
    end

    def meta_path_attrs
      {
        :'manifest:full-path' => "meta.xml",
        :'manifest:media-type' => "text/xml"
      }
    end

    def settings_path_attrs
      {
        :'manifest:full-path' => "settings.xml",
        :'manifest:media-type' => "text/xml"
      }
    end

    def content_path_attrs
      {
        :'manifest:full-path' => "content.xml",
        :'manifest:media-type' => "text/xml"
      }
    end

    def thumbnails_path_attrs
      {
        :'manifest:full-path' => "Thumbnails/thumbnail.png",
        :'manifest:media-type' => "image/png"
      }
    end

    def manifest_path_attrs
      {
        :'manifest:full-path' => "manifest.rdf",
        :'manifest:media-type' => "application/rdf+xml"
      }
    end

    def accellerator_path_attrs
      {
        :'manifest:full-path' => "Configurations2/accelerator/current.xml",
        :'manifest:media-type' => ""
      }
    end

    def configuration_path_attrs
      {
        :'manifest:full-path' => "Configurations2/",
        :'manifest:media-type' => "application/vnd.sun.xml.ui.configuration"
      }
    end

    def styles_path_attrs
      {
        :'manifest:full-path' => "styles.xml",
        :'manifest:media-type' => "text/xml"
      }
    end
  end
end
