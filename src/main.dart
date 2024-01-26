import 'core/note_app.dart';

void main(List<String> args) {
  // Initialization
  NoteApp app = NoteApp();
  print("\nHello! Welcome to your personal note keeping app.");

  const bool exampleNotes = true;

  if (exampleNotes) {
    app.list.addNote("Assignments",
        "I have a math assignment I need to get done this week. I gotta remember to do it in time before the English assignment deadline.");
    app.list.addNote("Groups",
        "I really gotta be careful about who I group up with in assigments, my last group practically did nothing at all. Especially Omar.");
    app.list.addNote("Gifts",
        "I saw some really cute-looking headphones in the gift shop this week. I should gift it to my sister when I get the money.");
  }
  // Loop
  while (app.isRunning) {
    app.run();
  }

  // Exit
  print("\nThank you for using our app!\nExiting now.\n");
}
