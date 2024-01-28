// here is all the logic and sequence  of event for the app
import 'dart:io';
import '../models/note_model.dart';
import 'utils.dart';

class NoteApp {
  void run() {
    //print the menu of the note app
    printMenu();

    NoteList noteList = NoteList();
    while (true) {
      NoteModel myNote = NoteModel();

      bool choiceValid = false;
      int choice = -1;
      while (!choiceValid) {
        try {
          stdout.write(enter("Enter a number: "));
          choice = int.parse(stdin.readLineSync()!);
          choiceValid = true;
        } catch (e) {
          print(errorMassage(
              "the value most be a number less then or equal to 6"));
        }
      }
      //switch statement for the options
      switch (choice) {
        case 1:
          noteList.addNote(myNote);
          break;
        case 2:
          noteList.edit();
          break;
        case 3:
          noteList.displayNote();
          break;
        case 4:
          noteList.delete();
          break;
        case 5:
          noteList.search();
          break;

        case 6:
          exit(0);

        default:
          print(errorMassage(
              "the value most be a number less then or equal to 6:"));
          break;
      }
      // call display function to display all notes
      displayAllNotes(noteList.noteList);
    }
  }
}
