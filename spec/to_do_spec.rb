require 'rspec'
require 'list'
require 'task'

describe Task do
  it "initializes an object that is an instance of the class" do
    test_task = Task.new("Learn the ruby object model")
    test_task.should be_an_instance_of Task
  end
  it'lets you read the description out' do
    test_task = Task.new("Learn the ruby object model")
    test_task.name.should eq "Learn the ruby object model"
  end
end

