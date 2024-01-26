// TODO: Add any utility functions here

/*but first
crating the list which will hold the values of title content and id note
but first the function that will display a table with the id and title of the note

*/

import 'dart:io';
import 'package:dolumns/dolumns.dart';
import '../models/note_model.dart';

void printMenu() {
  print('\n<<welcome to cli note app>>\n');
  final columns = dolumnify([
    ['id', 'note title'],
    ['', ' '],
  ], columnSplitter: ' | ', headerIncluded: true, headerSeparator: '=');
  print(columns);
  options();
}

void options() {
  print("1.add");
  print("2.edit");
  print("3.display note");
  print("4.delete");
  print("5.exit");
}

NoteList noteList = NoteList();
NoteModel myNote = NoteModel();

class NoteList {
  List<NoteModel> noteList = [];
  int id = 1;

  void addNote(NoteModel myNote) {
    myNote.id = id;
    id++;

    stdout.write("Enter note title: ");
    myNote.title = stdin.readLineSync();

    stdout.write("Enter note content (Enter 'q' to quit):");
    myNote.content = readMultilineContent();
    // myNote.content = stdin.readLineSync() as StringBuffer?;
    //first handel the content
    /*the user should be able to write multiline line note then quit when he
    write q and enter*/

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
      buffer.write('\n');
    }

    return buffer;
  }

// handle the error where the id is null later
  void displayNote() {
    //choice a note id
    stdout.write("Enter note id to display the note content: ");
    int noteId = int.parse(stdin.readLineSync()!);
    //look for the note id in the list
    NoteModel foundNote = noteList.firstWhere(
        (NoteModel note) => note.id == noteId,
        orElse: () => NoteModel());

    if (foundNote.id != -1) {
      // print the note title and content
      print('/n');
      print("Note Content:\n${foundNote.content}");
    } else {
      print("not a valid id");
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

  print("All Notes:\n");
  print(columns);
}
