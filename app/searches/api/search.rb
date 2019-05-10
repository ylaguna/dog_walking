class Api::Search
  DEFAULT_PER_PAGE = 25
  DEFAULT_MAX_PER_PAGE = 50

  attr_accessor :scope
  attr_reader :options

  def initialize(options = {})
    @options = options.with_indifferent_access
    @scope = search_class
  end

  def search
    params = prepare_search
    self.scope = self.scope
      .includes(params[:includes])
      .joins(params[:joins]) #should be defined at this class children to avoid -1 queries
      .where(params[:rules]) #business rules pre-defined
      .where(params[:filters]) #client-filters parsed
      .order(params[:order]) #client-order parsed
      .page(params[:page]) # Kaminari method
      .per(params[:per_page]) # Kaminari method
  end

  private

  def search_class
    raise NotImplementedError
  end

  def default_sort_attribute
    raise NotImplementedError
  end

  def permitted_sort_attributes
    raise NotImplementedError
  end

  def search_filter; end
  def search_rules; end
  def search_includes; end

  def prepare_search
    {
      includes: search_includes,
      rules: search_rules,
      filters: search_filter,
      order: order,
      page: options[:page],
      per_page: per_page
    }
  end

  def default_order_attribute
    :desc
  end

  def default_max_per_page
    DEFAULT_MAX_PER_PAGE
  end

  def order
    { order_attribute => order_direction }
  end

  def order_attribute
    return options[:sort_attribute] if permitted_sort_attributes.include?(options[:sort_attribute])

    if options[:sort_attribute].present?
      raise ActionController::BadRequest.new('Invalid param: sort_attribute')
    end

    default_sort_attribute
  end

  def order_direction
    if options[:sort_order].present?
      return options[:sort_order] if %w(desc asc).include?(options[:sort_order])
      raise ActionController::BadRequest.new('Invalid param: sort_order')
    end

    default_order_attribute
  end

  def per_page
    limiter = options[:per_page] || DEFAULT_PER_PAGE

    if limiter.to_i > DEFAULT_MAX_PER_PAGE
      raise ActionController::BadRequest.new('Invalid param: per_page limit exceeded')
    end

    limiter
  end
end

