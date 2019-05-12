class Operation
  attr_accessor :result

  def initialize(result)
    @result = result
  end

  def self.call(params = {})
    result = OperationResult.new
    self.new(result).run(params)
  end

  def run(params = {})
    begin
      catch :abort do
        self.validate(params)
        self.process(params) if result.success?
      rescue => e
        result.add_error(e.message)
      end
    end

    result
  end

  def process(params)
    raise NotImplementedError
  end

  def validate(params)
    raise NotImplementedError
  end

  def abort!(message = nil)
    result.add_error(message) if message
    throw :abort
  end
end
