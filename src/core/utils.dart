import 'note_list.dart';
import 'dart:io';

// returns a note index in the list
// get from either a string search that searches note title and content, or from note ID in list
int getNoteIndexFromInput(NoteList list, String prompt,
    {bool displayNote = true}) {
  while (true) {
    // Establish input
    String input = getStringInput(prompt +
        " (Search by typing the note's content or title, alternatively type the note's ID) ");

    try {
      // Try searching through integer ID by parsing input
      // Throws exception if input is not integer
      int inputInt = int.parse(input);

      // No exception thrown, which means input is integer
      // Menu displays indices incremented by 1, so we compensate by subtracting 1 from input to get index
      int index = inputInt - 1;

      // If the specified index in the note list exists, we return that index
      // If it doesn't exist, we just re-iterate the loop
      if (checkNoteAtIndexExists(list, index)) {
        if (displayNote) {
          print("\n================");
          print(list.notes[index].toString());
          print("================\n");
        }
        return index;
      }
    } catch (e) {
      // Exception thrown, search by string input instead

      // function returns -1 if note does not exist
      int index = getNoteIndexFromStringSearch(list, input);

      // If index equals -1, it means it does not exist. In this case we re-iterate the loop
      if (index != -1) {
        // index does not equal -1, so the note exists
        if (displayNote) {
          print("\n================");
          print(list.notes[index].toString());
          print("================\n");
        }
        return index;
      }
    }
  }
}

// checks if note at specified index exists
bool checkNoteAtIndexExists(NoteList list, int index) {
  try {
    list.notes[index]; // check for the exception
    return true;
  } catch (e) {
    print("Note with ID ${index + 1} does not exist.\n");
    return false;
  }
}

// returns note index according to search input
// searches through title and content of notes in list
// returns -1 if nothing is found
int getNoteIndexFromStringSearch(NoteList list, String input) {
  // Adjust input to lowercase
  // we do this to make the contains() function case-insensitive by also making the string compared lowercase
  String adjustedInput = input.toLowerCase();

  // Check through list to find case where title or content (both lowercase) contains the adjusted input
  int index = list.notes.indexWhere((element) =>
      element.content.toLowerCase().contains(adjustedInput) ||
      element.title.toLowerCase().contains(adjustedInput));

  // The indexWhere() function returns -1 if the elements are not found / don't exist
  if (index == -1) print("Note with search criterion '$input' not found\n");
  return index;
}

String getStringInput(String prompt, {bool nullable = false}) {
  bool validInput = false;
  String input = "";

  while (!validInput) {
    stdout.write(prompt);
    input = stdin.readLineSync()!;

    if (nullable)
      validInput = true; // if it's nullable no need to check if string is empty
    else {
      // string is non-nullable, check if string is empty
      if (!input.isEmpty)
        validInput = true;
      else
        print("Cannot have empty input!\n");
    }
  }

  return input;
}

bool getYesOrNoInput(String prompt) {
  bool choice = false;
  bool validInput = false;
  while (!validInput) {
    String input = getStringInput(prompt + " (Y/N) ");

    switch (input[0].toLowerCase()) {
      case ('y'):
        choice = true;
        validInput = true;
        break;
      case ('n'):
        validInput = true;
        break;
      default:
        print("Type 'Y' to confirm the operation, and 'N' to cancel it.");
        break;
    }
  }

  return choice;
}

int getNumberInput(String prompt) {
  bool validInput = false;
  int input = -1;

  while (!validInput) {
    try {
      stdout.write(prompt);
      input = int.parse(stdin.readLineSync()!);
      validInput = true;
    } catch (e) {
      print("Please type a valid number.\n");
    }
  }

  return input;
}
