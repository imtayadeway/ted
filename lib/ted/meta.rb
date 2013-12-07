module Ted
  class Meta < XmlDoc
    def generate
      # TODO: give ted a version
      xml.office(:'document-meta', document_meta_attrs) do
        xml.office(:meta) do
          xml.meta(:'initial-creator', ENV['USER'])
          xml.meta(:'creation-date', DateTime.now)
          xml.meta(:'document-statistic', document_statistic_attrs)
          xml.meta(:'generator', 'Ted')
        end
      end
    end

    def file
      @file ||= Tempfile.new(['meta', '.xml'])
    end

    def write
      file.write(generate)
      file.rewind
    end

  private

    def document_meta_attrs
      {
        :'xmlns:office'   => "urn:oasis:names:tc:opendocument:xmlns:office:1.0",
        :'xmlns:xlink'    => "http://www.w3.org/1999/xlink",
        :'xmlns:dc'       => "http://purl.org/dc/elements/1.1/",
        :'xmlns:meta'     => "urn:oasis:names:tc:opendocument:xmlns:meta:1.0",
        :'xmlns:ooo'      => "http://openoffice.org/2004/office",
        :'xmlns:grddl'    => "http://www.w3.org/2003/g/data-view#",
        :'office:version' => "1.2"
      }
    end

    def document_statistic_attrs
      # TODO: make these stats dynamic
      {
        :'meta:table-count'  => "1",
        :'meta:cell-count'   => "0",
        :'meta:object-count' => "0"
      }
    end
  end
end
