import 'dart:io';
import 'Note.dart';
class NoteApp {
  // TODO: Complete the run function
  void run() {
    
    print(" NOTE TAKING APP \n \n ***************** \n 1- Create a note \n 2- Edit a note \n 3- Delete a note \n 4- Search for a note \n 5- Exit \n ***************** \n ");
    
    print ("Choose an operation ");
    String? operation = stdin.readLineSync();
    do { 
    switch (operation) {
      //create a note
      case '1':
      //Note newNote= Note();

      String? newNoteTitle;
      String? newNoteContent;
         Note newNote= Note(newNoteTitle,newNoteContent);

      print("Title: \n ****");
      newNoteTitle = stdin.readLineSync();
      newNote.setTtile(newNoteTitle);
// setTtile && setContent  && CreateNote methods in Note class
      print ("content: \n ****");
      newNoteContent = stdin.readLineSync();
      newNote.setContent(newNoteContent);

      Note.CreateNote(newNote);
break;
      case '2':

      case '3':

      case '4':

  

      default:
    }
    } while (operation!=5);
    
  }
}
