//TODO: Define a note model class
class NoteModel {
  int id;
  String task_name;
  String description;
  bool isCompleted;

  // Default constructor
  NoteModel()
      : this.withDetails(
            id: 0, task_name: '', description: '', isCompleted: false);

  // Constructor with named parameters
  NoteModel.withDetails({
    required this.id,
    required this.task_name,
    required this.description,
    required this.isCompleted,
  });

  @override
  String toString() {
    String finished = isCompleted ? 'Yes' : 'No';
    print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
    return 'Task ID: $id \nTaskName: $task_name \nDescription: $description \nFinished: $finished';
  }
}
