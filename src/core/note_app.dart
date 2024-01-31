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
        createNote();
        break;

      case 2:
        editNoteScreen();
        break;

      case 3:
        deleteNoteScreen();
        break;

      case 4:
        searchNoteScreen();
        break;

      case 5:
        list.showIDs = !list.showIDs;
        break;

      case 6:
        exitApp();
        return;

      default:
        print("Please type a number between 1 and 6.\n");
        parseMainMenu();
        break;
    }
  }

  void createNote() {
    print("\nCreating Note...");
    String noteTitle = getStringInput("Note Title: ");
    String noteContent = getStringInput("Note: ");
    list.addNote(noteTitle, noteContent);
  }

  void editNoteScreen() {
    if (list.notes.isEmpty) {
      getStringInput("There are no notes to edit! Try creating some.",
          nullable: true);
      return;
    }

    int index =
        getNoteIndexFromInput(list, "Which note would you like to edit?");

    editNote(index);
  }

  void editNote(int noteIndex) {
    print("1. Edit note's title");
    print("2. Edit note's content");
    print("3. Cancel");
    int editChoice = getNumberInput("What would you like to do? ");

    switch (editChoice) {
      case 1:
        list.editNoteTitle(noteIndex);
        break;
      case 2:
        list.editNoteContent(noteIndex);
        break;
      case 3:
        return;
      default:
        print("Please type either '1', '2', or '3'\n");
        editNote(noteIndex);
        break;
    }
  }

  void deleteNoteScreen() {
    if (list.notes.isEmpty) {
      getStringInput("There are no notes to delete! Try creating some.",
          nullable: true);
      return;
    }

    int index =
        getNoteIndexFromInput(list, "\nWhich note would you like to delete?");

    deleteNote(index);
  }

  void deleteNote(int noteIndex) {
    if (getYesOrNoInput("Are you sure you want to delete this note?")) {
      list.deleteNote(noteIndex);
      getStringInput("\nNote deleted. Press anything to continue.",
          nullable: true);
    }
  }

  void searchNoteScreen() {
    if (list.notes.isEmpty) {
      getStringInput("There are no notes to search! Try creating some.",
          nullable: true);
      return;
    }
    int index = getNoteIndexFromInput(list, "Search for a note");
    print("1. Edit this note");
    print("2. Delete this note");
    print("3. Search for another note");
    print("4. Return to main menu");
    parseSearchScreen(index);
  }

  void parseSearchScreen(int noteIndex) {
    int input = getNumberInput("What would you like to do? (Type a number) ");
    print(""); // line break
    switch (input) {
      case 1:
        editNote(noteIndex);
        break;
      case 2:
        deleteNote(noteIndex);
        break;
      case 3:
        searchNoteScreen();
        break;
      case 4:
        return;
      default:
        print("Please type a number between 1 and 4.\n");
        parseSearchScreen(noteIndex);
        break;
    }
  }

  void exitApp() {
    if (getYesOrNoInput("Are you sure you want to exit the app?"))
      isRunning = false;
  }
}
