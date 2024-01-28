//TODO: Define a note model class

// here is the note properties and the constructor
class NoteModel {
  int? id;
  String? title;
  String? content;

  NoteModel({this.id = -1, this.title, this.content});
}
/*things need to be fixed
0.something wrong the add function fix it=> done you must crate NoteModel myNote = NoteModel(); in the while loop
.complete the edit method=>done
2.use try and catch blocks to handle errors like when note title is null and so on...=>done
4.maybe have the user ask for the options anytime he needs it instead of printing after etch choice
-fix this: when the user enters "not a valid id" keep asking for another id>=done
=======================
to do:-
-implement the search function=>done
-ask the user if he is sure he wants to delete a note so he can يتراجع=>done
-use the ansicolor  package to color output in the terminal=>done
-fix: the note title is not updating in the edit method
 */