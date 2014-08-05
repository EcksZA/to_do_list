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

  def sort_by_priority
    @tasks.sort_by! {|task| task.priority}.reverse
  end

  def sort_by_name
    @tasks.sort_by! {|task| task.name}
  end

  def sort_by_date
    @tasks.sort_by!  do |task|
      month, day, year = task.date.split("/")
      [month.to_i, day.to_i, year.to_i]
    end
  end
end
