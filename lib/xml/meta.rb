module Xml
  class Meta < XmlDoc
    def content
      xml.office(:'document-meta', document_meta_attrs) do
        xml.office(:meta) do
          xml.meta(:'initial-creator', ENV['USER'])
          xml.meta(:'creation-date', DateTime.now)
          xml.meta(:'document-statistic', document_statistic_attrs)
          xml.meta(:'generator', "Ted-#{ Ted.version }")
        end
      end
    end

    def name
      'meta'
    end

  private

    def document_meta_attrs
      config[:document_meta_attrs]
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
