import 'dart:io';
import '../models/note_model.dart';
import 'note_app.dart';

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
      break;
    case 4:
      viewNotes();
      break;
    case 5:
      searchNote();
      break;
    case 6:
      print("Think you for using the app");
      break;
    default:
      print("Invalid choive");
      break;
  }
}
void addNote(){
  stdout.write("ENTER NOTE TITLE: ");
  String? title = stdin.readLineSync();
  if (title == null || title.trim().isEmpty) {
    print("Title cannot be empty");
    return;
  }
  stdout.write("ENTER NOTE: ");
  String? theNote = stdin.readLineSync();
  if(theNote == null || theNote.trim().isEmpty){
    print("note cannot be empty");
    return;
    }
  notes.addNote(title, theNote);
  }
void viewNotes() {
    print(notes.toString());
  }

void editNote(){
  print("Choice note you want to edit");
  print("Do you want to Search by ID/title 1/2: ");
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
      } else {
        print("Note not found");
      }
      break;
    case 2:
      print("enter title: ");
      String? byTitle = stdin.readLineSync();
      var foundNote = notes.notes.firstWhere((note) => note.title == byTitle, orElse: () => NoteModel(id: -1, title: "", theNote: ""));
      if (foundNote.title != "") {
        print("Note found: ");
        print("Note found. Enter your edit: ");
        String? input = stdin.readLineSync();
        foundNote.updateNote(input!);
      } else {
        print("Note not found");
      }
      break;
    default:
      print("Invalid choive");
      break;
    }
  }

void searchNote(){
  print("Do you want to Search by ID/title 1/2: ");
  String? input = stdin.readLineSync();
  int searchBy = int.parse(input!);
  switch(searchBy){
    case 1:
      print("enter ID:");
      String? input = stdin.readLineSync();
      int byID = int.parse(input!);
      var foundNote = notes.notes.firstWhere((note) => note.id == byID, orElse: () => NoteModel(id: -1, title: "", theNote: ""));
      if (foundNote.id != -1) {
        print("Note found:");
        print("Note ID: ${foundNote.id}");
        print("Note Title: ${foundNote.title}");
        print("THE NOTE: ${foundNote.theNote}");
      } else {
        print("Note not found");
      }
      break;
    case 2:
      print("enter title: ");
      String? byTitle = stdin.readLineSync();
      var foundNote = notes.notes.firstWhere((note) => note.title == byTitle, orElse: () => NoteModel(id: -1, title: "", theNote: ""));
      if (foundNote.title != "") {
        print("Note found:");
        print("Note ID: ${foundNote.id}");
        print("Note Title: ${foundNote.title}");
        print("THE NOTE: ${foundNote.theNote}");
      } else {
        print("Note not found");
      }
      break;
    default:
      print("Invalid choive");
      break;
    }
  }
