class List
  @@all_lists = []

  def initialize(name)
    @name = name
    @tasks = []
  end

  def name
    @name
  end

  def List.all
    @@all_lists
  end

  def save
    @@all_lists << self
  end

  def tasks
    @tasks
  end

  def add_task(name)
    @tasks << name
  end
end
