import 'dart:ffi';
import 'dart:io';

import '../models/note_model.dart';

class NoteApp {
  List<NoteModel> notes = [];
  int index = -1;

  void run() {
    int choice;

    do {
      print('Welcome to the note-taking app!!\n1-New note.\n2-Edit note\n3-Delete note\n4-Search note.\n5-view notes.\n6-Exit');

      String? userInput = stdin.readLineSync();
      choice = int.parse(userInput!);

      switch (choice) {
        case 1:
          addNote();
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
          viewNotes();
          break;
        case 6:
          print('Exiting the note-taking app. Goodbye!');
          break;
        default:
          print('Invalid choice. Please enter a number between 1 and 5.');
      }
    } while (choice != 6);
  }

  void addNote() {
    String? title;

    do {
      print('Enter the note title: ');
      title = stdin.readLineSync();

      if (title == null || title.trim().isEmpty) {
        print('Invalid title. Please enter a non-empty title.');
      }
    } while (title == null || title.trim().isEmpty);

    print('Write the content: ');
    String? content = stdin.readLineSync();
    DateTime creationDate = DateTime.now();
    notes.add(NoteModel(title, content ?? '', creationDate));
    print('Note added successfully!');
  }

  void searchNote() {
    String title;

    if (notes.isNotEmpty) {
      do {
        print('Enter the note title: ');
        title = stdin.readLineSync()!;

        if (title == null || title.trim().isEmpty) {
          print('Invalid title. Please enter a title.');
        }
      } while (title == null || title.trim().isEmpty);

      for (int i = 0; i < notes.length; i++) {
        if (notes[i].title == title) {
          print('Note found');
          index = i;
        }
      }
    } else {
      print('You do not have notes yet');
    }
  }

  void deleteNote() {
    searchNote();
    if (index != -1) {
      notes.removeAt(index);
      print('Note deleted successfully!');
    } else {
      print('Note not found');
    }
  }

  void editNote() {
    searchNote();
    if (index != -1) {
      try {
        print('Enter the new title:');
        String? newTitle = stdin.readLineSync()!;
        if (newTitle == null || newTitle.trim().isEmpty) {
          print('Invalid input. Please enter a title.');
        } else {
          notes[index].title = newTitle;
          print('Enter the new content:');
          String? newContent = stdin.readLineSync();
          notes[index].content = newContent!;
          print('Note edited successfully!');
        }
      } catch (FormatException) {
        print('Invalid input');
      }
    } else {
      print('No note selected for editing');
    }
  }
  void viewNotes(){
    if (notes.isNotEmpty){
      for (int i = 0; i < notes.length; i++) {
        print('\nNote $i:');
        print('\nTitle: ${notes[i].title}');
        print('\nContent: ${notes[i].content}');
        print('\nCreation Date: ${notes[i].creartionDate}');
  }}
  else {
    print('You do not have notes yet');
  }

    
}}
  



