// ignore_for_file: unused_local_variable

import 'dart:io';
import 'utils.dart';
import '../models/note_model.dart';

class NoteApp {
  void run() {
    List<NoteModel> notes = [];
    print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
    print('Note App');

    var answer;

    do {
      print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
      print('What would you like to do?');
      print('1. Add a Note');
      print('2. Edit your Notes');
      print('3. Delete a Note');
      print('4. View your Notes');
      print('5. Search for a Note');
      print('6. Exit');

      try {
        answer = int.parse(stdin.readLineSync()!);
      } catch (e) {
        print('Invalid input. Please enter a number.');
      }
      print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");

      switch (answer) {
        case 1:
          do {
            addNote(notes);
            print('Do you want to add another Note? (yes/no):');
            print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
          } while (stdin.readLineSync()?.toLowerCase() == 'yes');

          break;

        case 2:
          editNoteDetails(notes);
          break;

        case 3:
          deleteNoteById(notes);
          break;

        case 4:
          viewAllNotes(notes);
          break;

        case 5:
          searchForNoteByKeyword(notes);
          break;

        case 6:
          print('Exit');
          print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
          exit(0);
          break;
      }
    } while (answer != 6);
  }
}
