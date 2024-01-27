//TODO: Define a note model class

// here is the note properties and the constructor
class NoteModel {
  int? id;
  String? title;
  StringBuffer? content;

  NoteModel({this.id = -1, this.title, this.content});
}
/*things need to be fixed
0.something wrong the add function fix it=> done you must crate NoteModel myNote = NoteModel(); in the loop
.complete the edit method
1. the id when a note is deleted must go back to 1
2.use try and catch blocks to handle errors like when note title is null and so on...
3.use the ansicolor  package to color output in the terminal
.ask the user if he is sure he wants to delete a note so he can يتراجع
4.maybe have the user ask for the options anytime he needs it instead of printing after etch choice
 */