import 'dart:io'; // For input/output

void main() {
  var noteApp = NoteTakingApp(); // Create an instance of the NoteTakingApp
  int option = 0;

  do {
    noteApp.displayMenu();
    stdout.write("Enter a number from 1 to 5: ");
    option = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

    try {
      switch (option) {
        case 1:
          noteApp.createNote();
          break;

        case 2:
          noteApp.editNote();
          break;

        case 3:
          noteApp.deleteNote();
          break;

        case 4:
          noteApp.searchNotes();
          break;

        case 5:
          print("Exiting Note Taking App...");
          print("---------------------------");
          break;

        default:
          print("❌ Invalid choice. Please enter a number between 1 and 5.");
          break;
      }
    } catch (e) {
      print("⚠️ An error occurred: $e");
    }
  } while (option != 5);
}

class NoteTakingApp {
  // Map to store notes: title -> content
  final Map<String, String> notes = {};

  void displayMenu() {
    print("\n========== Note Taking App ==========");
    print("1. Create a note");
    print("2. Edit a note");
    print("3. Delete a note");
    print("4. Search for a note");
    print("5. Exit the app");
    print("=====================================");
  }

  void createNote() {
    stdout.write("Enter note title: ");
    String title = stdin.readLineSync() ?? "";

    if (title.trim().isEmpty) {
      print("❌ Title cannot be empty.");
      return;
    }

    stdout.write("Enter note content: ");
    String content = stdin.readLineSync() ?? "";

    notes[title] = content; // Add a new note to the map
    print("✅ Note created successfully!");
  }

  void editNote() {
    stdout.write("Enter the title of the note you want to edit: ");
    String oldTitle = stdin.readLineSync() ?? "";

    if (!notes.containsKey(oldTitle)) {
      print("❌ Note not found!");
      return;
    }

    print("\nCurrent title: $oldTitle");
    print("Current content: ${notes[oldTitle]}");

    stdout.write("Enter new title (or press Enter to keep the same): ");
    String newTitle = stdin.readLineSync() ?? "";
    if (newTitle.trim().isEmpty) {
      newTitle = oldTitle; // Keep old title if user presses Enter
    }

    stdout.write("Enter new content (or press Enter to keep the same): ");
    String newContent = stdin.readLineSync() ?? "";
    if (newContent.trim().isEmpty) {
      newContent = notes[oldTitle] ?? "";
    }

    // If title changed, remove old entry and add new one
    if (newTitle != oldTitle) {
      notes.remove(oldTitle);
    }
    notes[newTitle] = newContent;

    print("✅ Note updated successfully!");
  }

  void deleteNote() {
    stdout.write("Enter the title of the note you want to delete: ");
    String title = stdin.readLineSync() ?? "";

    if (notes.containsKey(title)) {
      notes.remove(title); // Remove a note
      print("🗑️ Note deleted successfully!");
    } else {
      print("❌ Note not found.");
    }
  }

  void searchNotes() {
    stdout.write("Enter search term (title or content): ");
    String term = stdin.readLineSync() ?? "";

    var results = notes.entries
        .where((entry) =>
            entry.key.toLowerCase().contains(term.toLowerCase()) ||
            entry.value.toLowerCase().contains(term.toLowerCase()))
        .toList();

    if (results.isNotEmpty) {
      print("\n🔎 Search Results:");
      for (var entry in results) {
        print("---------------------------");
        print("Title  : ${entry.key}");
        print("Content: ${entry.value}");
      }
      print("---------------------------");
    } else {
      print("ℹ️ No matching notes found.");
    }
  }
}
