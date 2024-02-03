import 'dart:io';
import '../models/note.dart';

class NoteApp {
  final List<Note> notebook = [];

  void run() {
    print("Note taker");

    while(true){
      print("1: Show notes\n2: Add a note\n3: Open a note\n4: Modify a note\n5: Remove note\n-1: to Exit");
      print("");
      stdout.write("Choose an operation:");
      int choice = int.tryParse(stdin.readLineSync()!) ??0;

      if (choice <= -1) break;

      switch (choice) {
        case 1:
          if (notebook.isEmpty) print("No notes");
          else {
            for(final (int index, Note note) in notebook.indexed){
              print("Note ${index +1}: $note");
            }
          }
          break;
        case 2:
          print("Enter the note's title: ");
          final String newtitle = stdin.readLineSync()!;
          print("Enter the note's content: ");
          final String newcontent = stdin.readLineSync()!;
          addNote(newtitle,newcontent);
          break;
        case 3:
          print("Enter note's title: ");
          final String queried = stdin.readLineSync()!;
          print(getNote(queried));
          break;
        case 4:
          print("Enter the title of the note you want to modify: ");
          final String queried = stdin.readLineSync()!;
          print("Enter a new title: ");
          final String newtitle = stdin.readLineSync()!;
          print("Enter modified content: ");
          final String newcontent = stdin.readLineSync()!;
          if (getNote(queried) != null ){
            modNote(newtitle,newcontent,getNote(queried)!);
          } else
            print("Note not found\n\n");
          break;
        case 5:
          print("Enter the note's title: ");
          final String queried = stdin.readLineSync()!;
          if (getNote(queried) != null ){
            remNote(getNote(queried)!);
          } else
            print("Note not found\n\n");
          break;
        default:
          print("invalid option");
      }
    }
    print("Thanks bye");
  }

  Note? getNote(String query){
    // Look for keywords in the title and content of notes in the notebook. 
    query = query.toLowerCase(); 
    if (notebook.isEmpty){
      return null;
    }
    return notebook.firstWhere((note) =>
      note.title.toLowerCase().contains(query) ||
      note.content.toLowerCase().contains(query), orElse: null);
  }

  void addNote(String title, String content){
    // Add note to notebook
    notebook.add(Note(title: title, content: content));
  }

  bool remNote(Note note){
    // Remove given note and return false if note not in notebook
    return notebook.remove(note);
  }

  void modNote(String title, String content, Note note){
    // Replace given note with 
    note.title = title;
    note.content = content;
  }
}
