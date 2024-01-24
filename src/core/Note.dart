import 'note_app.dart';
class Note {
  // setTtile && setContent  && 
  //CreateNote methods in Note class
   String? Title, Content;

   
   Note(String? Title, String? Complete){
    this.Title=Title;
    this.Content=Content;
   }

   void setTtile(String? Title){
    this.Title=Title;
   }

   void setContent(String? Content){
    this.Content=Content;
   }

  static List<Note> Notes =[];

    static void CreateNote(Note newNote){
      Notes.add(newNote);
      print("Note added sucessfuly");
      
    }
   }




