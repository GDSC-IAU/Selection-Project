import 'dart:io';
import 'note.dart';

class NoteManager {
  List<Note> notes = [];
  int id = 1;

  //Create note
  void addNote(String? title, String? description) {
    if ((description == null || description.isEmpty) &&
        (title == null || title.isEmpty)) {
      stdout.write(
          "\nTitle and Description cannot be Empty. Try adding note again.\n");
    } else if (title == null || title.isEmpty) {
      stdout.write("\nTitle cannot be Empty. Try adding note again.\n");
    } else if (description == null || description.isEmpty) {
      stdout.write("\nDescription cannot be Empty. Try adding note again.\n");
    } else {
      notes.add(Note(id, title, description));
      id++;
      print("Note successfully created.");
      print("\n****************************************");
    }
  }

  //Edit notes
  void edit(noteid) {
    print("*****************Update Task*****************\n");
    if (notes.isNotEmpty) {
      for (int i = 0; i < notes.length; i++) {
        Note note = notes[i];
        if (note.id == noteid) {
          print("What do you want to update:");
          print("1)Title\n2)Description");
          int? option = int.tryParse(stdin.readLineSync() ?? '0');
          if (option == 1) {
            print("Please enter the new title: ");
            String? t = stdin.readLineSync();
            if (t == null || t.isEmpty) {
              stdout.write("\nTitle cannot be Empty. Try editing it again.\n");
            } else {
              note.title = t;
              print("Title of note updated successfully.");
            }
            print("\n*********************************************");
          } else if (option == 2) {
            print("Please enter the new description: ");
            String? d = stdin.readLineSync();
            if (d == null || d.isEmpty) {
              stdout.write(
                  "\nDescription cannot be Empty. Try editing it again.\n");
            } else {
              note.description = d;
              print("Description of note updated successfully.");
            }
            print("\n*********************************************");
          } else {
            print("Please enter a valid option to update.");
            print("\n*********************************************");
          }
        } else if (i == notes.length - 1) {
          print("ID not present.");
          print("\n*********************************************");
        }
      }
    } else {
      print("No Notes to update");
      print("\n*********************************************");
    }
  }

  //Delete notes
  void delete(noteid) {
    print("\n**************Delete Task**************");
    if (notes.isNotEmpty) {
      for (int i = 0; i < notes.length; i++) {
        Note note = notes[i];
        if (note.id == noteid) {
          notes.removeAt(i);
          print("Note Removed Successfully.");
          print("\n***************************************");
          break;
        } else if (i == notes.length - 1) {
          print("ID not present.");
          print("\n***************************************");
        }
      }
    } else {
      print("No Note to delete.");
      print("\n***************************************");
    }
  }

  //Search notes
  void search(noteid) {
    print("\n**************Search for a note***************");
    if (notes.isNotEmpty) {
      for (int i = 0; i < notes.length; i++) {
        Note note = notes[i];
        if (note.id == noteid) {
          print(
              "Note ID: ${note.id}\nNote name: ${note.title}\nNote Description: ${note.description}");
          print("\n**********************************************");
        } else if (i == notes.length - 1) {
          print("ID not present.");
          print("\n*********************************************");
        }
      }
    } else {
      print("No notes present.");
      print("\n*******************************************");
    }
  }

  //Display Notes
  void display() {
    print("\n**************Display Notes***************");
    if (notes.isNotEmpty) {
      for (int i = 0; i < notes.length; i++) {
        Note note = notes[i];
        print(
            "Note ID: ${note.id}\nNote name: ${note.title}\nNote Description: ${note.description}");
        print("\n*****************************************");
      }
    } else {
      print("No Notes present.");
      print("\n*******************************************");
    }
  }
}
