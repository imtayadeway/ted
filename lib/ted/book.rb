module Ted
  class Book
    attr_accessor :filename, :path, :sheets
    attr_reader :content, :manifest, :meta, :settings, :styles

    def self.build(filename, path)
      new(filename, path)
    end

    def initialize(filename, path)
      @filename = filename
      @path = path
      @sheets = []
      @content = Xml::Content.new
      @manifest = Xml::Manifest.new
      @meta = Xml::Meta.new
      @settings = Xml::Settings.new
      @styles = Xml::Styles.new
    end

    def xml_docs
      [content, manifest, meta, settings, styles]
    end

    def add_sheet(options = {})
      sheets << Ted::Sheet.new(options.delete(:name) || new_sheetname, options)
      sheets.last
    end

    def sheetnames
      sheets.map(&:name)
    end

    def save
      Zip::File.open(fqn, Zip::File::CREATE) do |zipfile|
        xml_docs.each do |xml_doc|
          xml_doc.write
          zipfile.add(xml_doc.full_name, xml_doc.path)
          xml_doc.close
        end
      end
    end

    def fqn
      File.join(path, filename + '.ods')
    end

  private

    def new_sheetname
      return 'Sheet 1' unless sheetnames.include?('Sheet 1')
      'Sheet 2'
    end
  end
end
