// TODO: Add any utility functions here

/*but first
crating the list which will hold the values of title content and id note
but first the function that will display a table with the id and title of the note
maybe make a method to handle null errors an use it across all the functions
*/

import 'dart:io';
import 'package:dolumns/dolumns.dart';
import '../models/note_model.dart';

//print the menu
void printMenu() {
  print('<<welcome to cli note app>>');
  final columns = dolumnify([
    ['id', 'note title'],
    ['', ' '],
  ], columnSplitter: ' | ', headerIncluded: true, headerSeparator: '=');
  print(columns);
  options();
}

//print the options
void options() {
  print("1.Create a note");
  print("2.Edit a note");
  print("3.display note");
  print("4.Delete a note");
  print("5.Search for a note");
  print("6.exit");
}

class NoteList {
  List<NoteModel> noteList = [];
  int id = 1;

  void addNote(NoteModel myNote) {
    myNote.id = id;
    id++;
    //add null checking here
    stdout.write("Enter note title: ");
    myNote.title = stdin.readLineSync();
    //add null checking here
    stdout.write("Enter note content (Enter 'q' to quit):\n");
    myNote.content = readMultilineContent();
    //add note to the list
    noteList.add(myNote);
  }

  StringBuffer? readMultilineContent() {
    StringBuffer buffer = StringBuffer();

    while (true) {
      String line = stdin.readLineSync() ?? '';

      if (line.trim().toLowerCase() == 'q') {
        break;
      }
      buffer.write(line);
      buffer.write('\n'); //removing this will massup the display
    }

    return buffer;
  }

//needs to use getNoteId
  void displayNote() {
    //choice a note id
    //needs null checking here
    stdout.write("Enter note id to display the note content: ");
    int noteId = int.parse(stdin.readLineSync()!);
    //look for the note id in the list
    NoteModel foundNote = findNoteById(noteId);

    if (foundNote.id != -1) {
      // print the note content
      print("________________________");
      print("Note Content:\n ${foundNote.content}");
    } else if (foundNote == Null) {
      print("note id can't be empty");
    } else {
      print("not a valid id");
    }
  }

  NoteModel findNoteById(int noteId) {
    return noteList.firstWhere((NoteModel note) => note.id == noteId,
        orElse: () => NoteModel());
  }

//!!!!complete the edit function to have the user chose to edit the note title or the content!!!
  void edit() {
    //needs null checking
    //choice a note id to edit
    stdout.write("Enter note id to edit note");
    int noteId = int.parse(stdin.readLineSync()!);
    NoteModel foundNote = findNoteById(noteId);
    if (foundNote.id != -1) {
      //ask wather the user want to edit the title or the content of the note
      // if the user wants to edit the title use noteList.title = stdin.readlinesync();
      //if the user wants to edit the content show the content in write mode then save
    } else {
      print("not a valid id");
    }
  }

  void delete() {
    int? noteId = getNoteId("Enter note id to delete note: ");
    NoteModel foundNote = findNoteById(noteId!); //why added !
    if (foundNote.id != -1) {
      noteList.remove(foundNote);
    } else {
      print("not a valid id"); // i think there is no need for this line of code
    }
  }
}

void displayAllNotes(List<NoteModel> noteList) {
  final columns = dolumnify([
    ['id', 'title'],
    for (var myNote in noteList)
      [
        myNote.id?.toString() ?? '',
        myNote.title ?? '',
      ],
  ], columnSplitter: ' | ', headerIncluded: true, headerSeparator: '=');

  print("________________________");
  print("All Notes:");
  print(columns);
  options();
}

//here a function to handle null checking using try catch blocks
int? getNoteId(String message) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();

    try {
      if (input != null) {
        return int.parse(input);
      }
    } catch (e) {
      print("Invalid input, Please enter a valid integer.");
    }
  }
}
