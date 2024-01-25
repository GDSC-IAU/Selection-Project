// TODO: Add any utility functions here

import 'dart:io';

class TaskListApp {
  int id;
  String task_name;
  String description;
  bool isCompleted;

  // Default constructor
  TaskListApp()
      : this.withDetails(
            id: 0, task_name: '', description: '', isCompleted: false);

  // Constructor with named parameters
  TaskListApp.withDetails({
    required this.id,
    required this.task_name,
    required this.description,
    required this.isCompleted,
  });

  @override
  String toString() {
    String finished = isCompleted ? 'Yes' : 'No';
    print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
    return 'Task ID: $id \nTaskName: $task_name \nDescription: $description \nFinished: $finished';

  }
}

extension IterableExtensions<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }
}

void addTask(List<TaskListApp> tasks) {

    print('What would you like your task name to be?');
    String? task_name;

    //to check if it's empty also asks again
    do {
      task_name = stdin.readLineSync();
      if (task_name!.isEmpty) {
        print("Task_name can't be empty. Please enter a Task name:");
      }
    } while (task_name.isEmpty);

    print('Enter your task description:');
    String? description;


    //to check if it's empty also asks again
    do {
      description = stdin.readLineSync();
      if (description!.isEmpty) {
        print("Description cannot be empty. Please enter a description:");
      }
    } while (description.isEmpty);

    print('Is your task completed:');
    String? input = stdin.readLineSync()?.trim().toLowerCase();
    bool isCompleted = input == 'y' || input == 'yes';
    print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");

    TaskListApp task = TaskListApp.withDetails(
      id: tasks.length + 1,
      task_name: task_name,
      description: description,
      isCompleted: isCompleted,
    );

    tasks.add(task);
}
