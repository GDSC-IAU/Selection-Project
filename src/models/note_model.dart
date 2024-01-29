//TODO: Define a note model class
//class NoteModel {}

import 'dart:io';

// Represents a note in the NoteTakingApp.
class Note {
  // The content of the note.
  String content;

  // Creates a new Note instance with the given content.
  Note(this.content);

  // Null safety feature: Creates an empty Note instance.
  factory Note.empty() {
    return Note('');
  }
}
