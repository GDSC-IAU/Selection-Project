class Note {
  String title;
  String content;

  Note({required this.title, required this.content});

  @override
  String toString() {
    String string = "";
    string += "$title\n";
    string += content;
    return string;
  }
}
