import 'dart:io';
import 'note_manager.dart';

void main(List<String> args) {
  NoteManager manager = new NoteManager();
  do {
    print("\n*********Welcome to Note Management System*********\n");
    stdout.write(
        'Please choose an option from the menu:\n1)Create Note\n2)Edit Note\n3)Delete Note\n4)Search Note\n5)Display Notes\n0)To Exit\n');

    int? option = int.tryParse(stdin.readLineSync() ?? '0');

    switch (option) {
      case 1:
        print("\n****************Create Note****************\n");
        stdout.write("Please enter the Note name: ");
        String? name = stdin.readLineSync();

        stdout.write("Please enter your Note: ");
        String? description = stdin.readLineSync();

        manager.addNote(name, description);
        break;
      case 2:
        print("\nPlease enter the ID of the note you wish to edit: ");
        int? id = int.tryParse(stdin.readLineSync() ?? '0');
        if (id == null) {
          print("\nPlease enter a number.");
        } else {
          manager.edit(id);
        }
        break;
      case 3:
        print("\nPlease enter the ID of the task you wish to delete: ");
        int? id = int.tryParse(stdin.readLineSync() ?? '0');
        if (id == null) {
          print("\nPlease enter a number.");
        } else {
          manager.delete(id);
        }
        break;
      case 4:
        print("\nPlease enter the ID of the note you want to search for:");
        int? id = int.tryParse(stdin.readLineSync() ?? '0');
        if (id == null) {
          print("\nPlease enter a number.");
        } else {
          manager.search(id);
        }
        break;
      case 5:
        manager.display();
        break;
      case 0:
        exit(0);
      default:
        print("\nPlease enter a valid option.\n");
    }
  } while (true);
}
