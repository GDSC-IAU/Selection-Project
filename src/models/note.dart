class Note{
  // Note properties
  String title, content;
  Note({ this.title = "", this.content = ""});

  // Format notes for printing
  @override toString(){
    return "\t\tTitle: $title \n\t\t\tContent: $content";
  }
}
