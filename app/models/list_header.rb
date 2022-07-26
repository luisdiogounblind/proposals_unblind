class ListHeader
  def initialize(model, method, options = {})
    @model = model
    @method = method
    @options = options
    @sortable = options[:sortable].nil? ? true : options[:sortable]
  end

  def content
    options[:content] || method.to_s.humanize
  end

  def sortable?
    @sortable
  end

  attr_reader :model, :method, :options

end
