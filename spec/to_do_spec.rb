require 'rspec'
require 'list'
require 'task'

describe Task do
  before do
    Task.clear
  end

  it "initializes an object that is an instance of the Task class" do
    test_task = Task.new("Learn the ruby object model")
    test_task.should be_an_instance_of Task
  end
  it'lets you read the description out' do
    test_task = Task.new("Learn the ruby object model")
    test_task.name.should eq "Learn the ruby object model"
  end

  describe ".all" do
    it "starts with an empty array" do
      Task.all.should eq []
    end
    it "gets added to array when save is called on an instance" do
      test_task = Task.new("Learn the ruby object model")
      test_task.save
      Task.all.should eq [test_task]
    end
  end

  describe ".clear" do
    it "empties out all the saved tasks" do
      Task.new("Learn the ruby object model").save
      Task.clear
      Task.all.should eq []
    end
  end

  describe ".remove_task" do
    it "removes selected task from list of tasks" do
      Task.new("Learn the ruby object model").save
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

  describe ".all" do
    it "initializes an empty list array" do
      List.all.should eq []
    end
    it "adds the list to the list array" do
      test_list = List.new("School Stuff")
      test_list.save
      List.all.should eq [test_list]
    end
  end
end

