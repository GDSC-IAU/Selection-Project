
class NoteModel {
    int id;
    String title;
    String theNote;

    NoteModel({
        this.id = -1,
        required this.title,
        required this.theNote
    });
}
class NoteList{
  List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  void addNote(String title, String theNote){
    _notes.add(NoteModel(
      id: _notes.length,
      title: title,
      theNote: theNote,
    ));
  }
  

  @override
  String toString(){
    String result = "";
    for (var note in _notes){
      result +=
        "==========================================\n";
      result +="Note ID: ${note.id}\n";
      result +="Note Title: ${note.title}\n";
      result +="THE NOTE: ${note.theNote}\n";
      result +=
        "==========================================\n";
    }
    return result;
  }
}