import 'dart:io';
import 'Note.dart';
 String? delNoteV, editNoteV, toEdit;
 
class NoteApp {
  // TODO: Complete the run function
  void run() {
    
    print(" NOTE TAKING APP \n \n ***************** \n 1- Create a note \n 2- Edit a note \n 3- Delete a note \n 4- Search for a note \n 5- Exit \n ***************** \n ");
    
    
    
      int operation ;
    do { 
      print ("Choose an operation ");
     operation = int.parse(stdin.readLineSync()!); ////string to int
    switch (operation) {
      //create a note
      case 1:
      //Note newNote= Note();

      String? newNoteTitle;
      String? newNoteContent;
         //Note newNote= Note(newNoteTitle,newNoteContent);

      print("Title: \n ****");
      newNoteTitle = stdin.readLineSync();
     // newNote.setTtile(newNoteTitle);
// setTtile && setContent  && CreateNote methods in Note class
      print ("content: \n ****");
      newNoteContent = stdin.readLineSync();
    //  newNote.setContent(newNoteContent);
Note newNote= Note(newNoteTitle,newNoteContent);
      Note.CreateNote(newNote);
      break;
      case 2: {

  print("To edit the title press (1), Content press (2)");
  try {
      int editSwitch= int.parse(stdin.readLineSync()!);
      switch (editSwitch) {
        case 1 : print ("Enter the title of the note to edit: ") ;
        toEdit=stdin.readLineSync();
        print ("enter the new title: ");
        editNoteV= stdin.readLineSync();
        Note.editTitleM(toEdit,editNoteV);
        break;

        case 2: 
        editNoteV= stdin.readLineSync();
        Note.editContentM(toEdit,editNoteV);
        break;

        default:
      }} catch(e){
        print ("invalid input");
      }}
      break;
  // editNoteV= stdin.readLineSync();
  // Note.editNoteM(editNoteV);
      case 3:
    //Delete a note
   
    // int len;
    // len= Note.NotesList.length;
    // print("Select a note to delete: ");
    // print(Note.NotesList);
    // for (int i=0; i< len  ;i++){
    // print(Note.NotesList[i]);
    // }
    print("Write the title of the note to delete: ");
    delNoteV= stdin.readLineSync();
    Note.deleteNoteM(delNoteV);
    case 4:
   
    print("\nAll Notes:");
  for (var note in Note.NotesList) {
    print("Title: ${note.Title}");
    print("Content: ${note.Content}");
  
    print("-----------");}
break;
      case 5:
    //searsh BY titile OR content

    print("To search by title press (1) and to search by Content press (2)");
  try {
      int editSwitch= int.parse(stdin.readLineSync()!);
      switch (editSwitch) {
        case 1 : print ("Enter the title of the note: ") ;
        toEdit=stdin.readLineSync();
        Note.searchByTitleM(editNoteV);
        break;

        case 2: 
         case 1 : print ("Enter the content of the note: ") ;
        toEdit=stdin.readLineSync();
        Note.searchByContentM(editNoteV);
        break;

        default:
      }} catch(e){
        print ("invalid input");
      }
      break;
  

      default:
    
    }
   } while (operation!=5);
    
  }
}
