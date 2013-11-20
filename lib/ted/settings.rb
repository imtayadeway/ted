module Ted
  class Settings < XmlDoc
    def generate
      document_settings
    end

  private

    def document_settings(&block)
      markup.office(:'document-settings', document_settings_attrs, &block)
    end

    def document_settings_attrs
      {
        'xmlns:office'   => "urn:oasis:names:tc:opendocument:xmlns:office:1.0",
        'xmlns:xlink'    => "http://www.w3.org/1999/xlink",
        'xmlns:config'   => "urn:oasis:names:tc:opendocument:xmlns:config:1.0",
        'xmlns:ooo'      => "http://openoffice.org/2004/office",
        'office:version' => "1.2"
      }
    end
  end
end
