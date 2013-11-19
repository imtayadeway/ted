module Ted
  class Meta < XmlDoc
    def generate
      document_meta do |dm|
        dm.office(:meta) do |m|
          m.meta(:'initial-creator', ENV['USER'])
          m.meta(:'creation-date', DateTime.now)
          m.meta(:'document-statistic', document_statistic_attrs)
          m.meta(:'generator', 'Ted')
        end
      end
    end

  private

    def document_meta(&block)
      markup.office(:'document-meta', document_meta_attrs, &block)
    end

  public

    def document_meta_attrs
      {
        'xmlns:office'   => "urn:oasis:names:tc:opendocument:xmlns:office:1.0",
        'xmlns:xlink'    => "http://www.w3.org/1999/xlink",
        'xmlns:dc'       => "http://purl.org/dc/elements/1.1/",
        'xmlns:meta'     => "urn:oasis:names:tc:opendocument:xmlns:meta:1.0",
        'xmlns:ooo'      => "http://openoffice.org/2004/office",
        'xmlns:grddl'    => "http://www.w3.org/2003/g/data-view#",
        'office:version' => "1.2"
      }
    end

    def document_statistic_attrs
      {
        'meta:table-count' => "1",
        'meta:cell-count' => "0",
        'meta:object-count' => "0"
      }
    end
  end
end
