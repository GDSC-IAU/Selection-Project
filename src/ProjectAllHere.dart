import 'dart:io';

// Represents a note in the NoteTakingApp.
class Note {
  // The content of the note.
  String content;

  // Creates a new Note instance with the given content.
  Note(this.content);

  //null safety feature: Creates an empty Note instance.
  factory Note.empty() {
    return Note('');
  }
}

// Represents a note-taking application.
class NoteTakingApp {
  String _appTitle = "Note Taking App";

  //just frame for the title
  int frameLength = 40;
  NoteTakingApp(){
    String leftFrame = '-' * (frameLength ~/ 2);
    String rightFrame = '-' * (frameLength - (frameLength ~/ 2) - 1);
    print('$leftFrame $_appTitle $rightFrame');
  }

  
  late List<Note> _notes = [];

  // Displays the main menu of the NoteTakingApp.
  void displayMenu() {
    print('1. Create a Note');
    print('2. Edit a Note');
    print('3. Delete a Note');
    print('4. Search for a Note');
    print('5. View Notes');
    print('6. Exit');
  }
  
  // Creates a new Note instance with the given content.
  void createNote() {
    print('\nEnter your Note:');
    try {
      String? noteContent = stdin.readLineSync();
      if (noteContent != null && noteContent.isNotEmpty) {
        _notes.add(Note(noteContent));
        print('\nNote added successfully!');
      } else {
        print('\nNote creation failed. Please try again.');
      }
    } catch (e) {
      print('\nAn error occurred: $e');
    }
    print('----------------');
  }


  // Edits the Note at the given index.
  void editNote(int index) {
    if (index >= 0 && index < _notes.length) {
      print('\nEnter the Edited Note: ');
      String? editNoteContent = stdin.readLineSync();
      if (editNoteContent != null && editNoteContent.isNotEmpty) {
        _notes[index] = Note(editNoteContent);
        print('\nNote edited successfully!');
      } else {
        print('\nNote editing failed. Please try again.');
      }
    } else {
      print('\nInvalid note index. Please try again.');
    }
    print('----------------');
  }

  // Deletes the Note at the given index.
  void deleteNote(int index) {
    if (index >= 0 && index < _notes.length) {
      _notes.removeAt(index);
      print('\nNote deleted successfully!');
    } else {
      print('\nInvalid note index. Please try again.');
    }
    print('----------------');
  }

  // Searches for Notes containing the given search term.
  void searchNotes(String searchTerm) {
    var foundNotes = _notes
        .where((note) =>
            note.content.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
    if (foundNotes.isEmpty) {
      print('\nNo matching notes found! \n');
      print('----------------');
    } else {
      print('\nMatching Notes:');
      print('');
      print('----------------');
      for (var note in foundNotes) {
        print(note.content);
      }
      print('----------------');
    }
  }

  // Displays all Notes in the NoteTakingApp.
  void viewNotes() {
    if (_notes.isEmpty) {
      print('\nNo notes found!');
      print('----------------\n');
    } else {
      print('Your Notes:');
      for (var i = 0; i < _notes.length; i++) {
        print('${i + 1}. ${_notes[i].content}');
      }
      print('----------------\n');
    }
  }



  // Runs the NoteTakingApp.
  void run() {
    //NoteTakingApp noteTakingApp = NoteTakingApp();

    int? choice;

    // Runs the NoteTakingApp until the user chooses to exit.
    while (choice != 6) {
      displayMenu();

      stdout.write('\nEnter your choice: ');
      try {
        // Parses the user input as an integer.
         choice = int.parse(stdin.readLineSync()!);
      } catch (e) {
        print('\nInvalid choice. Please enter a number. \n');
        choice = null;
        print('----------------');
      }

      // Checks if the user input was successfully parsed as an integer.
    if(choice != null)  {
      try {

        // Handles user input and performs the corresponding action.
        switch (choice) {
          case 1:
            print('----------------');
            // Creates a new note with an empty content.
            createNote();
            break;

          case 2:
            if (_notes.isEmpty) {
              print('\nNo notes found!');
              print('----------------\n');
            } else { 
              print('----------------\n');
              print('Enter the Index of the Note you Want to Edit: ');
              try{
                var index = int.parse(stdin.readLineSync()!) - 1;
                // Edits the note at the given index.
                editNote(index);
              } catch (e) {
                print('\nInvalid note index. Please try again.');
                print('----------------');
              }
            }
            break;

          case 3:
            if (_notes.isEmpty) {
              print('\nNo notes found!');
              print('----------------\n');
            } else {
              print('----------------\n');
              print('Enter the Index of the Note you Want to Delete: ');
              try {
                var index = int.parse(stdin.readLineSync()!) - 1;
                // Deletes the note at the given index.
                deleteNote(index);
              } catch (e) {
                print('\nInvalid note index. Please try again.');
                print('----------------');
              }
            }
            break;

          case 4:
            print('----------------\n');
            print('Enter the Note to Search for: ');
            var searchTerm = stdin.readLineSync()!;
            // Searches for notes containing the given search term.
            searchNotes(searchTerm);
            break;

          case 5:
            // Displays all notes.
            viewNotes(); 
            break;

          case 6:
            print('Exiting...');
            exit(0);
            break;

          default:
            print('Invalid choice. Please try again.');
            print('----------------');
            break;
        }
      } catch (e) {
        print('An error occurred: $e');
      }
    }
  }
  }
}


 // The entry point of the NoteTakingApp program.
void main() {
  // Creates an instance of the NoteTakingApp class and runs it.
  var noteTakingApp = NoteTakingApp();
  noteTakingApp.run();
}
