module Ted
  class Header < Cell
    attr_accessor :id, :name, :format

    def initialize(opts)
      @id = opts.fetch(:id)
      @name = opts.fetch(:name)
      @format = opts.fetch(:format, :general)
      super(column, 1, opts.fetch(:name))
    end
  end
end
