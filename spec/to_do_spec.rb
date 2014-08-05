require 'rspec'
require 'list'
require 'task'

describe Task do
  before do
    Task.clear
  end

  it "initializes an object that is an instance of the Task class" do
    test_task = Task.new("Learn the ruby object model", "7/1/14", 5)
    test_task.should be_an_instance_of Task
  end

  it'lets you read the name description out' do
    test_task = Task.new("Learn the ruby object model", "7/1/14", 5)
    test_task.name.should eq "Learn the ruby object model"
  end

  it'lets you read the date description out' do
    test_task = Task.new("Learn the ruby object model", "7/1/14", 5)
    test_task.date.should eq "7/1/14"
  end

  it'lets you read the priority description out' do
    test_task = Task.new("Learn the ruby object model", "7/1/14", 5)
    test_task.priority.should eq 5
  end

  describe ".all" do
    it "starts with an empty array" do
      Task.all.should eq []
    end
    it "gets added to array when save is called on an instance" do
      test_task = Task.new("Learn the ruby object model", "7/1/14", 5)
      test_task.save
      Task.all.should eq [test_task]
    end
  end

  describe ".clear" do
    it "empties out all the saved tasks" do
      Task.new("Learn the ruby object model", "7/1/14", 5).save
      Task.clear
      Task.all.should eq []
    end
  end

  describe ".remove_task" do
    it "removes selected task from list of tasks" do
      Task.new("Learn the ruby object model", "7/1/14", 5).save
      Task.remove_task("Learn the ruby object model")
      Task.all.should eq []
    end
  end
end

describe List do

  it "initializes the object that is an instance of the list class" do
    test_list = List.new("School Stuff")
    test_list.should be_an_instance_of List
  end
  it "defines the name of the instance" do
    test_list = List.new("School Stuff")
    test_list.name.should eq "School Stuff"
  end

  it "starts out with an empty list of tasks" do
    test_list = List.new("School Stuff")
    test_list.tasks.should eq []
  end

  it "can add tasks" do
    test_list = List.new("School Stuff")
    test_task = Task.new("Learn the ruby object model", "7/1/14", 5)
    test_list.add_task(test_task)
    test_list.tasks.should eq [test_task]
  end

  describe ".all" do
    it "initializes an empty list array" do
      List.all.should eq []
    end
    it "adds the list to the list array" do
      test_list = List.new("School Stuff")
      test_list.save
      List.all.should eq [test_list]
    end

    it "sorts the tasks within a list by priority" do
      test_list = List.new("School Stuff")
      test_task_1 = Task.new("Learn the ruby object model", "7/1/14", 5)
      test_list.add_task(test_task_1)
      test_task_2 = Task.new("Learn databases", "8/1/14", 1)
      test_list.add_task(test_task_2)
      test_task_3 = Task.new("Learn the angular.js framework", "9/1/14", 3)
      test_list.add_task(test_task_3)
      test_list.sort_by_priority.should eq [test_task_1, test_task_3, test_task_2]
    end

    it "sorts the tasks within a list by name" do
      test_list = List.new("School Stuff")
      test_task_1 = Task.new("Learn the ruby object model", "7/1/14", 5)
      test_list.add_task(test_task_1)
      test_task_2 = Task.new("Learn databases", "8/1/14", 1)
      test_list.add_task(test_task_2)
      test_task_3 = Task.new("Learn the angular.js framework", "9/1/14", 3)
      test_list.add_task(test_task_3)
      test_list.sort_by_name.should eq [test_task_2, test_task_3, test_task_1]
    end

    it "sorts the tasks within a list by date" do
      test_list = List.new("School Stuff")
      test_task_1 = Task.new("Learn the ruby object model", "10/1/14", 5)
      test_list.add_task(test_task_1)
      test_task_2 = Task.new("Learn databases", "8/1/14", 1)
      test_list.add_task(test_task_2)
      test_task_3 = Task.new("Learn the angular.js framework", "9/1/14", 3)
      test_list.add_task(test_task_3)
      test_list.sort_by_date.should eq [test_task_2, test_task_3, test_task_1]
    end
  end

  # describe ".done"
  #   it "creates a empty array" do
  #     List.done.should eq []
  #   end

  #   it "creates an array of taks that are marked by the user as done"
  #     test_list = List.new("School Stuff")
  #     test_task_1 = Task.new("Learn the ruby object model", "10/1/14", 5)
  #     test_list.add_task(test_task_1)
  #     test_task_2 = Task.new("Learn databases", "8/1/14", 1)
  #     test_list.add_task(test_task_2)
  #     test_task_3 = Task.new("Learn the angular.js framework", "9/1/14", 3)
  #     test_list.add_task(test_task_3)
  #     test_list.marked_done.should eq [test_task_2]
  #     test_list.tasks.should eq [test_task_1, test_task_3]
  #   end
  # end
end

