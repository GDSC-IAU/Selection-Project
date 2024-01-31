import 'dart:io';

class Note {
  late String title;
  late String content;

  Note({
    required this.title,
    required this.content,
  });
}

//Manage operation of program (create,edit,delete,search,display).
class NoteManager{
  List <Note> notes=[];


//Creates a new note and adds it to the list of notes.
 void createNote(){
  String title,content;
  print("Enter the note title: ");
  title=stdin.readLineSync() ?? "None";

  print("Enter the note content: ");
  content=stdin.readLineSync() ?? "None";

  Note newNote=Note(title:title,content:content);
  notes.add(newNote);

  print("The note is successfully created!");  
  }

  //Display all notes of the list. 
  void DisplayNote(){
    if(notes.isEmpty){
      print("Nothing to display!");
    }
    else{
      print("All notes: ");
      for(var note in notes)
        print("Title: ${note.title}\n Contents: ${note.content}\n ");

    }  
  }

  //Edit the title and content of note. 
  void EditNote(){
    if (notes.isEmpty) {
    print("Nothing to edit!");
    return;
  }
    print("Enter the title of the note to edit: ");
    String newTitle=stdin.readLineSync() ?? "None";
    for(var note in notes){
      if(note.title==newTitle){
        print("Enter a new title: ");
        note.title=stdin.readLineSync() ?? "None";

        print("Enter a new content: ");
        note.content=stdin.readLineSync() ?? "None";

        print("The note is successfully edited!");
        return;
        

      }
    }
    print("Note with title '$newTitle' not found\n ");  
  }
  
  //Delete specific note of the list.
 void DeleteNote() {
  if (notes.isEmpty) {
    print("Nothing to delete!");
    return;
  }

  print("Enter the title of the note to delete:");
  var noteToDeleteTitle = stdin.readLineSync();

  // Find the note index with the specified title.
  var noteIndexToDelete = notes.indexWhere((note) => note.title == noteToDeleteTitle);

  if (noteIndexToDelete == -1) {
    print("Note with title '$noteToDeleteTitle' not found!");
  } else {
    var deletedNote = notes.removeAt(noteIndexToDelete);
    print("Note deleted: ${deletedNote.title}");
  }
}


  //Search about specific note by title or content of note.
  void SearchNote() {
      if (notes.isEmpty) {
      print("Not found!");
      return;
    }

    print("Enter the title or content of the note to search:");
    var searchTitleOrContent = stdin.readLineSync() ?? "None";

    var matchingNotes = notes.where((note) =>
        note.title.contains(searchTitleOrContent) ||
        note.content.contains(searchTitleOrContent));

    if (matchingNotes.isEmpty) {
      print("No matching notes found!");
    } else {
      print("Matching notes: ");
      for (var note in matchingNotes) {
        print("Title: ${note.title}\nContents: ${note.content}\n");
      }
    }
  }

  }
        

  

//Note project
void main(List<String> args) {
  //NoteApp().run();
  NoteManager UserMenu= new NoteManager();
  
  

  do{

           try{ 
            //Menu of note
            print("**************Welcome to Noteapp**************");
            print("1.Create a note");
            print("2.Edit a note");
            print("3.Delete a note");
            print("4.Search for a note");
            print("5.Display all");
            print("6.Exit\n");
            stdout.write("Enter your choice: ");
            String userInput = stdin.readLineSync() ?? "None";
            int choice = int.parse(userInput);
            
            switch (choice) {
                    case 1:
                    UserMenu.createNote();
                    break;

                    case 2:
                    UserMenu.EditNote();
                    break;

                    case 3:
                    UserMenu.DeleteNote();
                    break;

                    case 4:
                    UserMenu.SearchNote();
                    break;

                    case 5:
                    UserMenu.DisplayNote();
                    break;

                    case 6:
                    print("Exitng the program.\n");
                    return;
                    
                default:
                print("Invalid number please choose 1 to 6 only!\n");
                    break;
                    
            }
           } on FormatException //catch for MissMatch Exception
           //catch for unexpected Exception(if input string)
           catch (e) {
           print("An unexpected error occurred: $e\n");
           }
           }
        while(true);
  

}
