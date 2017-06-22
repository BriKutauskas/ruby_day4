# Starting User Stories
#
# Story: As a developer, I can create a Task.
require "rspec"
require_relative "Task.rb"
require_relative "Storage.rb"

describe Task do
  it "creates a Task" do
    expect {Task.new}.to_not raise_error
  end

  it "can add a task and receive a description from task" do
    # task_1 = Task.new
    expect(Task.new.add_description("Buy eggs")).to eq("Buy eggs")
  end

  it "can mark a task as done" do
    task_1 = Task.new
    expect(task_1.done).to eq("done")
  end

  it "prints task that is done with description done" do
    task_1 = Task.new
    task_1.add_description("Buy eggs")
    task_1.done
    expect(task_1.to_s). to eq("Buy eggs, done")
  end

  it "adds tasks to TaskList and retrieves it" do
    task_1 = Task.new
    task_2 = Task.new
    storage_1 = TaskList.new
    expect{storage_1.stored(task_1)}.to change{storage_1.receive}
    expect{storage_1.stored(task_2)}.to change{storage_1.receive}
  end

  it "retrieves completed items from tasklist" do
    task_1 = Task.new
    task_2 = Task.new
    task_3 = Task.new
    task_1.add_description("Buy eggs")
    task_1.done
    storage_1 = TaskList.new
    storage_1.stored(task_1)
    storage_1.stored(task_2)
    storage_1.stored(task_3)
    expect(storage_1.receive_completed).to eq([task_1])
  end

  it "retrieves incomplete items from a tasklist" do
    task_1 = Task.new
    task_2 = Task.new
    task_3 = Task.new
    task_1.add_description("Buy eggs")
    task_1.done
    storage_1 = TaskList.new
    storage_1.stored(task_1)
    storage_1.stored(task_2)
    storage_1.stored(task_3)
    expect(storage_1.receive_incomplete).to eq([task_2, task_3])
  end

  # it "retrieve incomplete items from tasklist" do
  #   task_1 = Task.new
  #   task_2 = Task.new
  #   task_1.add_description("Buy eggs")
  #   task_1.done
  #   storage_1 = TaskList.new
  #   storage_1.stored(task_1)
  #   storage_1.stored(task_2)
  #   expect(storage_1.receive_completed).to eq([task_1])
  # end


end


# Story: As a developer, I can give a Task a title and retrieve it.
#
# Story: As a developer, I can give a Task a description and retrieve it.
#
# Story: As a developer, I can mark a Task done.
#
# Story: As a developer, when I print a Task that is done, its status is shown.
# Hint: Implement to_s have it return the features of a Task with labels (for instance, "Title: Buy Food Description: Bananas, milk").
#
# Story: As a developer, I can add all of my Tasks to a TaskList.
# Hint: A TaskList has-many Tasks
#
# Story: As a developer with a TaskList, I can get the completed items.
#
# Story: As a developer with a TaskList, I can get the incomplete items.
#
# Epic: Due Date
#
# Story: As a developer, I can create a DueDateTask, which is-a Task that has-a due date.
# Hint: Use the built-in Ruby Date class
#
# Story: As a developer, I can print an item with a due date with labels and values.
# Hint: When implementing to_s, use super to call to_s on the super class.
#
# Story: As a developer, I can add items with due dates to my TaskList.
# Hint: Consider keeping items with due dates separate from the other items.
#
# Story: As a developer with a TaskList, I can list all the not completed items that are due today.
#
# Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
#
# Story: As a developer with a TaskList with and without due dates, I can list all the not completed items in order of due date, and then the items without due dates.
#
# Epic: Anniversary
#
# Story: As a developer, I can create a to do item for an anniversary (a yearly recurring event) .
# Hint: An Anniversary has a month and a day.
# Hint: An Anniversary is a special kind of DueDateTask where the due date changes depending on the current date (override the due_date method to return the next annivesary date).
#
# Story: As a developer, I can print an item for an anniversary with field labels and values.
#
# Story: As a developer with a TaskList with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month.
#
# Story: As a developer with a TaskList with a collection of items with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month, then the items without due dates.
