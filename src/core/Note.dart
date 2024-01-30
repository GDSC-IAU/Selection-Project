import 'note_app.dart';
class Note {
  // setTtile && setContent  && 
  //CreateNote methods in Note class
   String? Title, Content;

   
   
   Note(String? Title, String? Complete){
    this.Title=Title;
    this.Content=Content;
   }

   //var TitleListContent =[Note("hello","world dmdm"),];
  //  var map= Map.fromIterable(TitleListContent, key: (item) => Note.Title, value: (item) => Note.Content);



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
//  static List<Map<String?,Note>> NotesList = [
//   {"Title" : Note.Title,
//   "Content" : Note.Content} ,
//  ];
// Note NotesList=[];

 ///////// // List<Map<String?, dynamic>> NotesList = [
  // { "Title" : "Note 1 ", "Content": "helllllooo" } , ];

    static void CreateNote(Note newNote){
      // NotesList.add(newNote);
      // print("Note added sucessfuly");
    
//   List<Map<Note.Title,Note.Content>> NotesList = [
//   {"Title" : Note.Title,
//   "Content" : Note.Content} ,
//  ];
 NotesList.add(newNote);
      print("Note added sucessfuly");
      
    }

    static void deleteNoteM(String? delNoteV){
      bool found=false;
      for (int i =0; i<NotesList.length ;i++){
       //Note result= NotesList.firstWhere((element) => element.Title == deleteNoteM , orElse: () => null   );
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
      // print("To edit the title press (1), Content press (2)");
      // int editSwitch;
      // swtitch (editSwitch){
      //   1 :
      // }
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
      // print("To edit the title press (1), Content press (2)");
      // int editSwitch;
      // swtitch (editSwitch){
      //   1 :
      // }
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
          print("Note is found! \n ============ Content: ");
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
        if (NotesList[i].Title== content){
          found =true;
         print("Note is found! \n ============ Title: ");
          print(NotesList[i].Title);
          break;
        }
          
      }
      if(!found){
        print("note wasn't found");
      }
    }

   }




