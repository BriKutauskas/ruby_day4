
class Task
  def initialize
    @description
    @done = "not done"
  end

  def add_description(description)
    @description = description
  end

  def done
    @done = "done"
  end

  def if_done
    @done
  end

  def to_s
    if (Task.new.done == "done")
      "#{@description}, #{@done}"
    end
  end

end
