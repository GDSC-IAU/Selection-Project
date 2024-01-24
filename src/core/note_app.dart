import 'note_list.dart';
import 'utils.dart';

class NoteApp {
  NoteList list = NoteList();
  bool isRunning;

  NoteApp({this.isRunning = true});

  void run() {
    printMainMenu();
  }

  void printMainMenu() {
    print(""); // Line break

    print(list.toString());

    print("1. Create a note");
    print("2. Edit a note");
    print("3. Delete a note");
    print("4. Search for a note");
    print(list.showIDs ? "5. Disable IDs in list" : "5. Enable IDs in list");
    print("6. Exit");

    parseMainMenu();
  }

  void parseMainMenu() {
    int input = getNumberInput("What would you like to do? (Type a number) ");

    switch (input) {
      case 1:
        // Create a note
        String noteTitle = getStringInput("Note Title: ");
        String noteContent = getStringInput("Note: ");
        list.addNote(noteTitle, noteContent);
        break;

      case 2:
        // Edit a note
        print("");
        if (list.notes.isEmpty) {
          getStringInput("There are no notes to edit! Try creating some.",
              nullable: true);
          break;
        }
        break;

      case 3:
        // Delete a note
        print("");
        if (list.notes.isEmpty) {
          getStringInput("There are no notes to delete! Try creating some.",
              nullable: true);
          break;
        }

        break;

      case 4:
        if (list.notes.isEmpty) {
          getStringInput("There are no notes to search! Try creating some.");
          break;
        }
        int index = getNoteIndexFromInput(list, "Select a note from list: ");
        print(list.notes[index].toString());
        getStringInput("");
        break;

      case 5:
        list.showIDs = !list.showIDs;
        break;

      case 6:
        isRunning = false;
        return;

      default:
        print("Please type a number between 1 and 6.");
        parseMainMenu();
        break;
    }
  }
}
