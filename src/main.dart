import 'core/note_app.dart';

void main(List<String> args) {
  // Initialization
  NoteApp app = NoteApp();
  print("\nHello! Welcome to your personal note keeping app.");

  // Loop
  while (app.isRunning) {
    app.run();
  }

  // Exit
  print("\nThank you for using our app!\nExiting now.\n");
}
