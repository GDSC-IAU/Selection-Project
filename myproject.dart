import 'dart:io'; // to add input,output

void main() {
  var noteApp = NoteTakingApp(); //Create an instance of the NoteTakingApp
  var optione;

  do {
    noteApp.DisplayManu();
    print("Enter a number from 1 to 5:");
    optione = int.tryParse(stdin.readLineSync()!) ?? 0;

    try {
      switch (optione) {
        // using swittch to evaluate the optione statment
        case 1:
          noteApp.Create();
          break;

        case 2:
          noteApp.Edit();
          break;

        case 3:
          noteApp.Delete();
          break;

        case 4:
          noteApp.Search();
          break;

        case 5:
          print("Exiting Note Taking App.");
          print("---------------------------");
          break;

        default:
          print("Invalid choice. please enter a number between 1 to 5.");
          break;
      }
    } catch (e) {
      print("An error acored: $e");
    }
  } while (optione != 5);
}

class NoteTakingApp {
  var notes = <String, String>{}; //Map to store notes

  void DisplayManu() {
    print("\nNote Taking App");
    print("1.Create a note");
    print("2.Edit a note");
    print("3.Delete a note");
    print("4.Search for a note");
    print("5.Exit the app");
  }

  void Create() {
    print("Enter note title: ");
    var title = (stdin.readLineSync() ?? "");
    print("Enter note content: ");
    var content = (stdin.readLineSync() ?? "");
    notes[title] = content; //Add a new note to the map
    print("Note created successfully!");
  }

  void Edit() {
    print("Enter a titel you want to edit: ");
    var title = (stdin.readLineSync() ?? "");
    if (notes.containsKey(title)) {
      print("Enter new title: ");
      var NewTitle = (stdin.readLineSync() ?? "");
      notes[title] = NewTitle; //Edit a title of an existing note
      print("Note edit successfully!");
    } else {
      print("Note not found!");
    }
  }

  void Delete() {
    print("Enter the title of note you want to delete: ");
    var title = stdin.readLineSync()!;
    if (notes.containsKey(title)) {
      notes.remove(title); //Remove a note
      print("Note deleted successfully!");
    } else {
      print("Note not found");
    }
  }

  void Search() {
    print("Enter search term(Titel or Contant): ");
    var term = (stdin.readLineSync() ?? "");
    var results = notes.entries
        .where(
            (entry) => entry.key.contains(term) || entry.value.contains(term))
        .toList();
    if (results.isNotEmpty) {
      print("\nSearch Results:");
      results.forEach((entry) {
        print("Title: ${entry.key}");
        print("Content: ${entry.value}");
      });
    } else {
      print("No matching notes is found");
    }
  }
}
