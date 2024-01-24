import 'core/note_app.dart';

void main(List<String> args) {
  // Initialization
  NoteApp app = NoteApp();
  print("\nHello! Welcome to your personal note keeping app.");

  //app.list.addNote("Lectures", "I hate long lectures, they suck");
  //app.list.addNote("Math", "Math can be pretty difficult");
  //app.list.addNote("Movies", "Why do so many movies these days suck?");

  // Loop
  while (app.isRunning) {
    app.run();
  }

  // Exit
  print("\nThank you for using our app!\nExiting now.\n");
}
