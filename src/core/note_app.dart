import '../models/note_model.dart';
import 'utils.dart';
import 'dart:io';

NoteList notes = NoteList();

class NoteApp {


  
  void run() {
    //print('Hello, world!');
    int choice =0;
    while(choice != 6){
      printMenu();

      bool choiceValid = false;

      while (!choiceValid) {
        stdout.write("Enter your choice: ");
        String? input = stdin.readLineSync();
        try {
          int choice = int.parse(input!);
          handleChoice(choice);
          choiceValid = true;
        } catch (e) {
          print("Please enter a number\n");
        }
      }
      handleChoice;
    }
    
  }
}