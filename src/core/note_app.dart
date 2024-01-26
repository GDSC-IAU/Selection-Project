// here is all the logic and sequence  of event for the app
import 'dart:io';
import 'utils.dart';

class options1 {
  // TODO: Complete the run function
  void run() {
    //print the menu of the note app
    printMenu();

    while (true) {
      // catch errors of entering anything but numbers for options
      bool choiceValid = false;
      int choice = -1;
      while (!choiceValid) {
        try {
          stdout.write("Enter a number: ");
          choice = int.parse(stdin.readLineSync()!);
          choiceValid = true;
        } catch (e) {
          print("the value most be a number less then or equal to 5: ");
        }
      }
      //switch statement for the options
      switch (choice) {
        case 1:
          // call add note function
          noteList.addNote(myNote);
          break;
        case 2:
          // taskList.edit();
          break;
        case 3:
          noteList.displayNote();
          break;
        case 4:
          //taskList.delete();
          break;

        case 5:
          exit(0);

        default:
          print("the value most be a number less then or equal to 5:");
          break;
      }
      // call display function to display all notes
      displayAllNotes(noteList.noteList);

      //call options for the user
      options();
    }
  }
}
