// TODO: Add any utility functions here

import 'dart:io';
import '../models/note_model.dart';

extension IterableExtensions<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }
}

void addNote(List<NoteModel> Notes) {
  print('What would you like your Note name to be?');
  String? note_name;

  //to check if it's empty also asks again
  do {
    note_name = stdin.readLineSync();
    if (note_name!.isEmpty) {
      print("the Note name can't be empty. Please enter a name:");
    }
  } while (note_name.isEmpty);

  print('Enter your Note description:');
  String? description;

  //to check if it's empty also asks again
  do {
    description = stdin.readLineSync();
    if (description!.isEmpty) {
      print("Description cannot be empty. Please enter a description:");
    }
  } while (description.isEmpty);

  print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");

  NoteModel task = NoteModel.withDetails(
    id: Notes.length + 1,
    note_name: note_name,
    description: description,
  );

  Notes.add(task);
}

void editNoteDetails(List<NoteModel> notes) {
  print('Edit Note');
  print('Enter the Note ID you want to edit:');
  int noteID = int.parse(stdin.readLineSync()!);

  NoteModel? noteToEdit = notes.firstWhereOrNull((note) => note.id == noteID);

  if (noteToEdit != null) {
    updateNoteDetails(noteToEdit);
    print('Note edited successfully!!');
  } else {
    print('Note not found with ID $noteID :(');
  }
  print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
}

void updateNoteDetails(NoteModel note) {
  print('What would you like your new Note name to be?');

  if (stdin.readLineSync()!.isNotEmpty) {
    note.note_name = stdin.readLineSync()!;
  } else {
    note.note_name = getNonEmptyInput('Note name');
  }

  print('Enter the new Note description:');

  if (stdin.readLineSync()!.isNotEmpty) {
    note.description = stdin.readLineSync()!;
  } else{
  note.description = getNonEmptyInput('Description');
  }
}

void deleteNoteById(List<NoteModel> notes) {
  print('Delete Note');
  print('Enter the Note ID you want to delete:');
  int noteIdToDelete = int.parse(stdin.readLineSync()!);

  int initialLength = notes.length;
  notes.removeWhere((note) => note.id == noteIdToDelete);

  if (notes.length < initialLength) {
    print('Note deleted successfully!!');
  } else {
    print('Note not found with ID $noteIdToDelete :(');
  }
  print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
}

void viewAllNotes(List<NoteModel> notes) {
  print('Here is your Notes:');
  for (var note in notes) {
    print(note);
  }
  print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
}

void searchForNoteByKeyword(List<NoteModel> notes) {
  String? answer;

  do {
    print('Search for Note');
    print('Enter the keyword to search for a Note:');
    String searchKeyword = stdin.readLineSync()!.toLowerCase();

    List<NoteModel> matchingNotes = notes
        .where((note) =>
            note.note_name.toLowerCase().contains(searchKeyword) ||
            note.description.toLowerCase().contains(searchKeyword))
        .toList();

    if (matchingNotes.isNotEmpty) {
      print('Matching Notes:');
      for (var note in matchingNotes) {
        print(note);
      }
    } else {
      print('No matching Notes found.');
    }
    print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");

    print('Do you want to search for another Note? (yes/no):');
    print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
    answer = stdin.readLineSync()?.toLowerCase();
  } while (answer == 'yes' || answer == 'y');
}

String getNonEmptyInput(String fieldName) {
  String? input;
  do {
    print('$fieldName cannot be empty. Please enter a $fieldName:');
    input = stdin.readLineSync();
  } while (input!.isEmpty);
  return input;
}
