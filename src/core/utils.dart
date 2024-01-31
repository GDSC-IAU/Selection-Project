import 'dart:io';
import '../models/note_model.dart';
import 'note_app.dart';

String redColor = '\x1B[31m';
String blueColor = '\x1B[34m';
String greenColor = '\x1B[32m';
String resetColor = '\x1B[0m';

void printMenu(){
  print("==========================================");
  print("NOTE TAKING APP");
  print("==========================================");
  print("Select your service: ");
  print("1. Create note");
  print("2. Edit note");
  print("3. Delete note");
  print("4. View notes");
  print("5. Search");
  print("6. Exit");
  print("==========================================");
}

void handleChoice(int choice){
  switch(choice){
    case 1:
      addNote();
      break;
    case 2:
      editNote();
      break;
    case 3:
      deleteNote();
      break;
    case 4:
      viewNotes();
      break;
    case 5:
      searchNote();
      break;
    case 6:
      print("Think you for using the app.");
      break;
    default:
      print(redColor + "Invalid choive." + resetColor);
      break;
  }
}

void addNote(){
  stdout.write("ENTER NOTE TITLE: ");
  String? title = stdin.readLineSync();
  if (title == null || title.trim().isEmpty) {
    print(redColor + "Title cannot be empty." + resetColor);
    return;
  } else if (notes.notes.any((note) => note.title == title)) {
    print(redColor + "Title cannot be repeated." + resetColor);
    return;
  }
  stdout.write("ENTER NOTE: ");
  String? theNote = stdin.readLineSync();
  if(theNote == null || theNote.trim().isEmpty){
    print(redColor + "Note cannot be empty." + resetColor);
    return;
    }
  notes.addNote(title, theNote);
  print(greenColor + "Note added successfully." + resetColor);
  }

void viewNotes() {
    print(notes.toString());
  }

void editNote(){
  print("Choose note you want to edit.");
  print("Do you want to choose by" + blueColor + " ID/title (1/2)" + resetColor + ": ");
  String? input = stdin.readLineSync();
  int searchBy = int.parse(input!);
  switch(searchBy){
    case 1:
      print("enter ID: ");
      String? input = stdin.readLineSync();
      int byID = int.parse(input!);
      var foundNote = notes.notes.firstWhere((note) => note.id == byID, orElse: () => NoteModel(id: -1, title: "", theNote: ""));
      if (foundNote.id != -1) {
        print("Note found. Enter your edit: ");
        String? input = stdin.readLineSync();
        foundNote.updateNote(input!);
        print(greenColor + "Note with ID \"${foundNote.id}\" edited successfully." + resetColor);
      } else {
        print(redColor + "Note not found." + resetColor);
      }
      break;
    case 2:
      print("enter title: ");
      String? byTitle = stdin.readLineSync();
      var foundNote = notes.notes.firstWhere((note) => note.title == byTitle, orElse: () => NoteModel(id: -1, title: "", theNote: ""));
      if (foundNote.title != "") {
        print("Note found. Enter your edit: ");
        String? input = stdin.readLineSync();
        foundNote.updateNote(input!);
        print(greenColor + "Note with title \"${foundNote.title}\" edited successfully." + resetColor);
      } else {
        print(redColor + "Note not found." + resetColor);
      }
      break;
    default:
      print(redColor + "Invalid choive." + resetColor);
      break;
  }
}

void deleteNote(){
  print("Choose note you want to delete.");
  print("Do you want to choose by" + blueColor + " ID/title (1/2)" + resetColor + ": ");
  String? input = stdin.readLineSync();
  int searchBy = int.parse(input!);
  switch(searchBy){
    case 1:
      print("enter ID: ");
      String? input = stdin.readLineSync();
      int byID = int.parse(input!);
      var foundNote = notes.notes.firstWhere((note) => note.id == byID, orElse: () => NoteModel(id: -1, title: "", theNote: ""));
      if (foundNote.id != -1) {
        notes.deleteNoteById(foundNote.id);
        print(greenColor + "Note with ID \"${foundNote.id}\" found deleted successfully." + resetColor);
      } else {
        print(redColor + "Note not found." + resetColor);
      }
      break;
    case 2:
      print("enter title: ");
      String? byTitle = stdin.readLineSync();
      var foundNote = notes.notes.firstWhere((note) => note.title == byTitle, orElse: () => NoteModel(id: -1, title: "", theNote: ""));
      if (foundNote.title != "") {
        notes.deleteNoteByTitle(foundNote.title);
        print(greenColor + "Note with Title \"${foundNote.title}\" found deleted successfully." + resetColor);
      } else {
        print(redColor + "Note not found." + resetColor);
      }
      break;
    default:
      print(redColor + "Invalid choive." + resetColor);
      break;
  }
}

void searchNote(){
  print("Do you want to Search by" + blueColor + " ID/title (1/2)" + resetColor + ": ");
  String? input = stdin.readLineSync();
  int searchBy = int.parse(input!);
  switch(searchBy){
    case 1:
      print("enter ID:");
      String? input = stdin.readLineSync();
      int byID = int.parse(input!);
      var foundNote = notes.notes.firstWhere((note) => note.id == byID, orElse: () => NoteModel(id: -1, title: "", theNote: ""));
      if (foundNote.id != -1) {
        print(greenColor + "Note found:" + resetColor);
        print("Note ID: ${foundNote.id}");
        print("Note Title: ${foundNote.title}");
        print("THE NOTE: ${foundNote.theNote}");
      } else {
        print(redColor + "Note not found." + resetColor);
      }
      break;
    case 2:
      print("enter title: ");
      String? byTitle = stdin.readLineSync();
      var foundNote = notes.notes.firstWhere((note) => note.title == byTitle, orElse: () => NoteModel(id: -1, title: "", theNote: ""));
      if (foundNote.title != "") {
        print(greenColor + "Note found:" + resetColor);
        print("Note ID: ${foundNote.id}");
        print("Note Title: ${foundNote.title}");
        print("THE NOTE: ${foundNote.theNote}");
      } else {
        print(redColor + "Note not found." + resetColor);
      }
      break;
    default:
      print(redColor + "Invalid choive." + resetColor);
      break;
    }
  }
