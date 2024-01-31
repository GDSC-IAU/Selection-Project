import 'dart:io';
import '../models/note_model.dart';

class NoteApp {
  List<NoteModel> notes = [];

  void run() {
    while (true) {
      displayMenu();

      stdout.write('Enter your choice (1-5): ');
      final choice = int.tryParse(stdin.readLineSync() ?? '');

      if (choice == null || choice < 1 || choice > 5) {
        print('Invalid choice. Please try again.');
        continue;
      }

      switch (choice) {
        case 1:
          createNote();
          break;
        case 2:
          editNote();
          break;
        case 3:
          deleteNote();
          break;
        case 4:
          searchNote();
          break;
        case 5:
          print('Exiting...');
          return;
      }
    }
  }

  void createNote() {
    stdout.write('Enter note title: ');
    final title = stdin.readLineSync() ?? '';
    stdout.write('Enter note content: ');
    final content = stdin.readLineSync() ?? '';

    final note = NoteModel(
      title: title,
      content: content,
    );

    notes.add(note);
    print('Note created successfully!');
  }

  void editNote() {
    if (notes.isEmpty) {
      print('No notes available.');
      return;
    }

    print('Available notes:');
    for (var i = 0; i < notes.length; i++) {
      print('$i. ${notes[i].title}');
    }

    stdout.write('Enter note index to edit: ');
    final index = int.tryParse(stdin.readLineSync() ?? '');

    if (index == null || index < 0 || index >= notes.length) {
      print('Invalid note index.');
      return;
    }

    stdout.write('Enter new note title: ');
    final newTitle = stdin.readLineSync() ?? '';
    stdout.write('Enter new note content: ');
    final newContent = stdin.readLineSync() ?? '';

    notes[index].title = newTitle;
    notes[index].content = newContent;

    print('Note edited successfully!');
  }

  void deleteNote() {
    if (notes.isEmpty) {
      print('No notes available.');
      return;
    }

    print('Available notes:');
    for (var i = 0; i < notes.length; i++) {
      print('$i. ${notes[i].title}');
    }

    stdout.write('Enter note index to delete: ');
    final index = int.tryParse(stdin.readLineSync() ?? '');

    if (index == null || index < 0 || index >= notes.length) {
      print('Invalid note index.');
      return;
    }

    notes.removeAt(index);
    print('Note deleted successfully!');
  }

  void searchNote() {
    stdout.write('Enter search query: ');
    final query = stdin.readLineSync() ?? '';

    final filteredNotes = notes.where((note) =>
        note.title.toLowerCase().contains(query.toLowerCase()) ||
        note.content.toLowerCase().contains(query.toLowerCase()));

    if (filteredNotes.isEmpty) {
      print('No notes found.');
      return;
    }

    print('Search results:');
    for (var note in filteredNotes) {
      print('Title: ${note.title}');
      print('Content: ${note.content}');
      print('---');
    }
  }

  void displayMenu() {
    print('Welcome to Note App!');
    print('1. Create a note');
    print('2. Edit a note');
    print('3. Delete a note');
    print('4. Search for a note');
    print('5. Exit');
  }
}