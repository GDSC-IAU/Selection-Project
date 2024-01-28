// TODO: Add any utility functions here

/*but first
crating the list which will hold the values of title content and id note
but first the function that will display a table with the id and title of the note
maybe make a method to handle null errors an use it across all the functions
*/

import 'dart:io';
import 'package:dolumns/dolumns.dart';
import '../models/note_model.dart';
import 'package:ansicolor/ansicolor.dart';

//for the header menu
AnsiPen menu = AnsiPen()..cyan(bold: true);
//for anytime the user have to enter something
AnsiPen enter = AnsiPen()..green();
//for the content in display
AnsiPen content = AnsiPen()..blue();
//for the are you sure to delate prompt
AnsiPen deleteColor = AnsiPen()..yellow();
//for error messages
AnsiPen errorMassage = AnsiPen()..red();

//print the menu
void printMenu() {
  print(menu('\n<<welcome to cli note app>>\n'));
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

  //adding notes
  void addNote(NoteModel myNote) {
    myNote.id = id;
    id++;
    while (true) {
      stdout.write(enter("Enter note title: "));
      myNote.title = stdin.readLineSync();

      if (myNote.title != null && myNote.title!.isNotEmpty) {
        break;
      }
      print(errorMassage("Title can't be empty."));
    }

    //add null checking here=> just handle that in the readMultilineContent()=>done
    stdout.write(enter("Enter note content (Enter 'q' to quit):\n"));
    myNote.content = readMultilineContent();
    //add note to the list
    noteList.add(myNote);
  }

  //display note contents
  void displayNote() {
    int? noteId;
    NoteModel foundNote;
    while (true) {
      noteId = getNoteId(enter("Enter note id to display the note content: "));
      foundNote = findNoteById(noteId!);

      if (foundNote.id != -1) {
        // print the note content
        print("________________________");
        print(content("Note Content:\n ${foundNote.content}"));
        break;
      } else {
        print(errorMassage("not a valid id"));
      }
    }
  }

  NoteModel findNoteById(int noteId) {
    return noteList.firstWhere((NoteModel note) => note.id == noteId,
        orElse: () => NoteModel());
  }

  //fix: the note title is not updating=>done
  void edit() {
    int? noteId;
    NoteModel foundNote;

    while (true) {
      noteId = getNoteId(enter("Enter note id to edit note: "));
      foundNote = findNoteById(noteId!);
      if (foundNote.id != -1) {
        while (true) {
          stdout.write(enter("Enter new note title: "));
          String? newTitle = stdin.readLineSync();
          foundNote.title = newTitle;
          if (newTitle != null && newTitle.isNotEmpty) {
            break;
          }

          // Handle Empty
          print(errorMassage("title can't be empty."));
        }
        stdout.write(enter("Enter new note content: "));
        foundNote.content = readMultilineContent();
        break;
      } else {
        print("not a valid id");
      }
    }
  }

  //delete method
  void delete() {
    int? noteId;
    NoteModel foundNote;
    while (true) {
      noteId = getNoteId(enter("Enter note id to delete note: "));
      foundNote = findNoteById(noteId!);
      if (foundNote.id != -1) {
        stdout.write(deleteColor(
            "are you sure you want to delete note with ID: ${noteId}? y/n: "));
        String? sure = stdin.readLineSync();
        if (sure != null && sure.toLowerCase() == "y") {
          noteList.remove(foundNote);
          break;
        } else if (sure == "n") {
          print("user canceled delete note with iD: ${noteId}");
          break;
        } else {
          print(errorMassage("Please enter y/n"));
        }
      }
    }
  }

  //search method
  void search() {
    stdout.write(enter("Enter search query: "));
    String? query = stdin.readLineSync();
    // String lowerCaseNoteContent = myNote.content
    if (query != null && query.isNotEmpty) {
      List<NoteModel> matchingNote = noteList
          .where((note) =>
              (note.title?.toLowerCase().contains(query.toLowerCase()) ==
                  true) ||
              //fix: can't use toLowerCase on stringBuffer
              (note.content?.toLowerCase().contains(query.toLowerCase()) ==
                  true))
          .toList();
      if (matchingNote.isNotEmpty) {
        print("________________________");
        print(content("Matching Notes: \n"));
        for (var note in matchingNote) {
          print(content("ID: ${note.id}, Note Title: ${note.title}"));
          print(content("${note.content}"));
        }
      } else {
        print("No matching notes found.");
      }
    } else {
      print(errorMassage("search can't be empty."));
    }
  }
}

/*add null checking here for the content => don't know why not working=> it dose work but
when the user adds lines by pressing enter it considers the content to be not empty*/
String? readMultilineContent() {
  StringBuffer buffer = StringBuffer();
  String? line;

  while (true) {
    line = stdin.readLineSync() ?? '';
    if (line.trim().toLowerCase() == 'q') {
      break;
    }
    buffer.write(line);
    buffer.write('\n'); //don't remove this
  }
  if (buffer.isNotEmpty) {
    return buffer.toString();
  } else {
    print(errorMassage("Content can't be empty."));
  }
  return null;
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
  print(menu("All Notes:-\n"));
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
      print(errorMassage("Invalid id, Please enter a valid integer."));
    }
  }
}
