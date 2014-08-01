class Task
  @@all_tasks = []

  def Task.clear
    @@all_tasks = []
  end

  def Task.all
    @@all_tasks
  end

  def save
    @@all_tasks << self
  end

  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end
