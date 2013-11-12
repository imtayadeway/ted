module Ted
  class Meta
    attr_accessor :markup

    include XmlDoc

    def initialize
      @markup = Builder::XmlMarkup.new(indent: 0)
      markup.instruct! :xml, encoding: 'UTF-8'
    end

    def generate
      document_meta do |dm|
        dm.office(:meta) do |m|
          m.meta(:'initial-creator') { |ic| }
          m.meta(:'creation-date') { |cd| }
          m.meta(:'document-statistic') { |ds| }
          m.meta(:'generator') { |g| }
        end
      end
    end

  private

    def document_meta(&block)
      markup.office(:'document-meta', document_meta_attrs, &block)
    end
  end
end
