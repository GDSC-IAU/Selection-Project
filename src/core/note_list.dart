import '../models/note.dart';

class NoteList {
  List<Note> notes = [];
  bool showIDs = false;
  NoteList();

  void addNote(String noteTitle, String noteContent) {
    Note note = Note(title: noteTitle, content: noteContent);
    notes.add(note);
  }

  void editNote() {}

  void deleteNote() {}

  @override
  String toString() {
    String string = "";
    if (!notes.isEmpty) {
      // There are notes
      for (int i = 0; i < notes.length; i++) {
        string += "================\n";
        if (showIDs) string += "${i + 1}\n"; // Print IDs if they're enabled
        string += "${notes[i].toString()}\n";
      }
      string += "================\n";
    } else // There are no notes
      string += "You have no notes at the moment. Try creating some.\n";
    return string;
  }
}
