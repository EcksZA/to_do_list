class Task
  @@all_tasks = []

  def Task.remove_task(task_to_remove)
    @@all_tasks.each do |each_task|
      if each_task.name == task_to_remove
        @@all_tasks.delete(each_task)
      end
    end
  end

  def Task.clear
    @@all_tasks = []
  end

  def Task.all
    @@all_tasks
  end

  def save
    @@all_tasks << self
  end

  def initialize(name, date, priority)
    @name, @priority = name, priority
    @date = date
  end

  def name
    @name
  end

  def date
    @date
  end

  def priority
    @priority
  end
end
