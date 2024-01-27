//TODO: Define a note model class
class NoteModel {
  int id;
  String note_name;
  String description;

  // Default constructor
  NoteModel()
      : this.withDetails(
            id: 0, note_name: '', description: '');

  // Constructor with named parameters
  NoteModel.withDetails({
    required this.id,
    required this.note_name,
    required this.description,
  });

  @override
  String toString() {
    print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
    return 'Note ID: $id \nNoteName: $note_name \nDescription: $description ';
  }
}
