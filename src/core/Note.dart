import 'note_app.dart';
class Note {
  
   String? Title, Content;

   
   
   Note(String? title, String? content){
    this.Title= title;
    this.Content=content;
   }


   void setTtile(String? Title){
    this.Title=Title;
   }

   void setContent(String? Content){
    this.Content=Content;
   }

   String? getTitle(){
    return Title;
   }

   String? getContent(){
    return Content;
   }

static  List<Note> NotesList =[];

    static void CreateNote(Note newNote){
      
 NotesList.add(newNote);
      print("Note added sucessfuly");
      
    }

    static void deleteNoteM(String? delNoteV){
      bool found=false;
      for (int i =0; i<NotesList.length ;i++){
       
        if (NotesList[i].Title== delNoteV){
          found =true;
          NotesList.removeAt(i);
          print("note was deleted sucessfully");
          break;
        }
          
      }
      if(!found){
        print("note wasn't found");
      }

    }

    static void editTitleM(String? toEdit ,String? editNoteV){
      
        bool found=false;
      for (int i =0; i<NotesList.length ;i++){
        if (NotesList[i].Title== toEdit){
          found =true;
          NotesList[i].setTtile(editNoteV);
          print("note was edited sucessfully");
          break;
        }
          
      }
      if(!found){
        print("note wasn't found");
      }
    }


static void editContentM(String? toEdit ,String? editNoteV){
      
        bool found=false;
      for (int i =0; i<NotesList.length ;i++){
        if (NotesList[i].Title== toEdit){
          found =true;
          NotesList[i].setContent(editNoteV);
          print("note was edited sucessfully");
          break;
        }
          
      }
      if(!found){
        print("note wasn't found");
      }
    }

    static void searchByTitleM(String? title){
       bool found=false;
      for (int i =0; i<NotesList.length ;i++){
        if (NotesList[i].Title== title){
          found =true;
          print("Note is found! \n =============== \n Content: \n ===============");
          print(NotesList[i].Content);
          break;
        }
          
      }
      if(!found){
        print("note wasn't found");
      }
    }

    static void searchByContentM(String? content){
      bool found=false;
      for (int i =0; i<NotesList.length ;i++){
        if (NotesList[i].Content== content){
          found =true;
         print("Note is found! \n ============ \n Title: ");
          print(NotesList[i].Title);
          break;
        }
          
      }
      if(!found){
        print("note wasn't found");
      }
    }

   }




