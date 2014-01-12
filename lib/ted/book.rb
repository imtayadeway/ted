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
      @content = Ted::Content.new
      @manifest = Ted::Manifest.new
      @meta = Ted::Meta.new
      @settings = Ted::Settings.new
      @styles = Ted::Styles.new
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
    
    def compose
      xml_docs.each { |xml_doc| xml_doc.write }
    end

    def save
      Zip::File.open(fqn, Zip::File::CREATE) do |zipfile|
        xml_docs.each do |xml_doc|
          zipfile.add(xml_doc.full_name, xml_doc.path)
        end
      end
      
      xml_docs.each(&:close)
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
