import '../models/note.dart';
import 'utils.dart';

class NoteList {
  List<Note> notes = [];
  bool showIDs = false;
  NoteList();

  void addNote(String noteTitle, String noteContent) {
    Note note = Note(title: noteTitle, content: noteContent);
    notes.add(note);
  }

  void editNoteTitle(int noteIndex) {
    print("\nOld Title: " + notes[noteIndex].title);
    notes[noteIndex].title = getStringInput("New Title: ");
  }

  void editNoteContent(int noteIndex) {
    print("\nPrevious Content: " + notes[noteIndex].content);
    notes[noteIndex].content = getStringInput("Updated Content: ");
  }

  void deleteNote(int noteIndex) {
    notes.removeAt(noteIndex);
  }

  @override
  String toString() {
    String string = "";
    if (!notes.isEmpty) {
      // There are notes
      for (int i = 0; i < notes.length; i++) {
        string += "================\n";

        if (showIDs)
          string += "Note ID: ${i + 1}\n"; // Print IDs if they're enabled

        string += "${notes[i].toString()}\n";
      }
      string += "================\n";
    } else // There are no notes
      string += "You have no notes at the moment. Try creating some.\n";
    return string;
  }
}
