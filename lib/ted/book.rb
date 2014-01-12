module Ted
  class Book
    attr_accessor :filename, :sheets 
    attr_reader :content, :manifest, :meta, :settings, :styles
    
    def self.build(filename)
      new(filename)
    end

    def initialize(filename)
      @filename = filename
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

    def save
      File.new("#{ filename }.ods", 'w')
    end
    
  private
    
    def new_sheetname
      return 'Sheet 1' unless sheetnames.include?('Sheet 1')
      'Sheet 2'
    end
  end
end
