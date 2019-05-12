class DogWalkingOperations::Toogle < Operation
  # {
  #   dog_walk: DogWalk
  #   new_status: opts ['started', 'finished' ]
  # }
  def process(params)
    return unless validate(params)

    dog_walk = params[:dog_walk]

    case params[:new_status]
    when 'started'
      start_walk(dog_walk)
    when 'finished'
      finish_walk(dog_walk)
    end
  end

  def validate(params)
    validate_dog_walk(params[:dog_walk])
    validate_status(params[:dog_walk], params[:new_status])

    @result.success?
  end

  private

  def validate_dog_walk(dog_walk)
    @result.add_error 'invalid dog walk' unless dog_walk.is_a? DogWalk
    @result.add_error 'invalid dog walk' unless dog_walk.valid?
  end

  def validate_status(dog_walk, new_status)
    return @result.add_error 'cant change a finished walk' if dog_walk.status == 'finished'
    return @result.add_error 'new _status is required' unless new_status
    return @result.add_error "invalid new_status must eq 'started' of 'finished'" unless ['started', 'finished'].include? new_status
    return @result.add_error 'new status cant be the same as the old one' if dog_walk.status == new_status
  end

  def start_walk(dog_walk)
    dog_walk.started_at = Time.now
    dog_walk.status = :started
    dog_walk.save!
  end

  def finish_walk(dog_walk)
    dog_walk.finished_at = Time.now
    dog_walk.status = :finished
    dog_walk.save!
  end
end
