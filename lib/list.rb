class List
  @@all_lists = []

  def initialize(name)
    @name = name
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
end
