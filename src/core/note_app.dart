// ignore_for_file: unused_local_variable

import 'dart:io';
import 'utils.dart';
import '../models/note_model.dart';

class NoteApp {
  // TODO: Complete the run function
  void run() {
    List<NoteModel> tasks = [];
    print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
    print('Task List App');

    var answer;

    do {
      print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
      print('What would you like to do?');
      print('1. Add task');
      print('2. Edit task');
      print('3. Delete task');
      print('4. View tasks');
      print('5. Exit');

      try {
        answer = int.parse(stdin.readLineSync()!);
      } catch (e) {
        print('Invalid input. Please enter a number.');
      }
      print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");

      switch (answer) {
        case 1:
          String? answer1;

          do {
            addTask(tasks);
            print(
                'Do you want to add another task? Please answer with yes or no:');
            print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
            answer1 = stdin.readLineSync()?.toLowerCase();
          } while (answer1 == 'yes' || answer1 == 'y');

          break;

        case 2:
          print('Edit task');
          print('Enter the task ID you want to edit:');
          int taskId = int.parse(stdin.readLineSync()!);

          NoteModel? taskToEdit =
              tasks.firstWhereOrNull((task) => task.id == taskId);

          if (taskToEdit != null) {
            print('What would you like your new task name to be?');
            String name = stdin.readLineSync()!;

            if(name.isEmpty)
            {
                print("Task name cannot be empty");
                break;
            }
            taskToEdit.task_name = name;



            print('Enter the new task description:');
            taskToEdit.description = stdin.readLineSync()!;

            print('Is you task completed:');
            String? input = stdin.readLineSync()?.trim().toLowerCase();
            bool isCompleted = input == 'y' || input == 'yes';

            print('Task edited successfully!!');
          } else {
            print('Task not found with ID $taskId :(');
          }
          print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
          break;

        case 3:
          print('Delete task');
          print('Enter the task ID you want to delete:');
          int taskIdToDelete = int.parse(stdin.readLineSync()!);

          int initialLength = tasks.length;
          tasks.removeWhere((task) => task.id == taskIdToDelete);

          if (tasks.length < initialLength) {
            print('Task deleted successfully!!');
          } else {
            print('Task not found with ID $taskIdToDelete :(');
          }
          print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
          break;

        case 4:
          print('Here is your tasks:');
          for (var task in tasks) {
            print(task);
          }
          print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
          break;

        case 5:
          print('Exit');
          print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
          exit(1);
          break;

        default:
          print('Invalid input');
          print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
          break;
      }
    } while (answer != 5);
  }
}
