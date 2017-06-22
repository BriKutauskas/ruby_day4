require_relative "Task.rb"

class TaskList

  def initialize
    @task_list = []
    @result = []
  end

  def stored (task_type)
    @task_list += [task_type]
  end

  def receive
    @task_list
  end

  def receive_completed
    result = @task_list.select do |element|
      if(element.if_done == "done")
        @result << element
      end
    end
  end

  def receive_incomplete
    result = @task_list.select do |element|
      if(element.if_done == "not done")
        @result << element
      end
    end
  end

end
