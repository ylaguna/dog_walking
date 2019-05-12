class OperationResult
  attr_reader :errors, :data

  def initialize
    @errors = []
    @data = {}
  end

  def success?
    errors.empty?
  end

  def failure?
    !success?
  end

  def add_error(error)
    errors << error
  end

  def assign(key, value)
    @data[key] = value
  end
end
