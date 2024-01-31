import 'dart:io';
import 'Note.dart';
 String? delNoteV, editNoteV, toEdit;
 
class NoteApp {
  
  void run() {
    
    
      int operation ;
    do { 
        print(" \nNOTE TAKING APP \n \n ***************** \n 1- Create a note \n 2- Edit a note \n 3- Delete a note \n 4- Print notes \n 5- Search for a note \n 6- Exit \n ***************** \n ");
    
      print ("Choose an operation ");
     operation = int.parse(stdin.readLineSync()!); 
     if (operation>0 && operation <7){
    switch (operation) {
     
      case 1:
       //create a note
    try{
      String? newNoteTitle;
      String? newNoteContent;
         
      print("Title: \n ****");
      newNoteTitle = stdin.readLineSync();
     
      print ("content: \n ****");
      newNoteContent = stdin.readLineSync();
    
Note newNote= Note(newNoteTitle,newNoteContent);
      Note.CreateNote(newNote);
      break;} catch (e){
       print ("invalid input");
      }
      case 2: {
        //Edit a note's title or content

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
        print ("Enter the title of the note to edit: ") ;
        toEdit=stdin.readLineSync();
        print ("enter the new Cotent: ");
        editNoteV= stdin.readLineSync();
        Note.editContentM(toEdit,editNoteV);
        break;

        default:
        print ("invalid input");
      }} catch(e){
        print ("invalid input");
      }}
      break;
 
      case 3:
    //Delete a note
   try{
    print("Write the title of the note to delete: ");
    delNoteV= stdin.readLineSync();
    Note.deleteNoteM(delNoteV);
    break; 
    } catch (e){
       print ("invalid input");
    }
    case 4:
   // print all notes
   try{ 
  print("\n    All Notes:");
print("  _______________________ ");

for (var i = 0; i < Note.NotesList.length; i++) {
  print(" |                      |");
  print(" | Title: ${Note.NotesList[i].Title}");
  print(" | Content: ${Note.NotesList[i].Content} ");
  print(" |                      | ");
  print(" |______________________| ");
}
break;}
catch (e){
   print ("invalid input");
}
      case 5:
    //searsh BY titile OR content

    print("To search by title press (1) and to search by Content press (2)");
  try {
      int searchSwitch= int.parse(stdin.readLineSync()!);
      switch (searchSwitch) {
        case 1 :
       print ("Enter the title of the note: ") ;
        toEdit=stdin.readLineSync();
        Note.searchByTitleM(toEdit);
        break;

        case 2: 
        print ("Enter the content of the note: ") ;
        toEdit=stdin.readLineSync();
        Note.searchByContentM(toEdit);
        break;

        default:
        print("Invalid choice");

      }} catch(e){
        print ("invalid input");
      }
      break;
  

      default:
       exit;
    
    }}
   } while ( operation!=6);
    
  }
}
