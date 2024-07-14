
# Simple Note App

Welcome to my Simple Note App! This simple console application allows you to manage your notes easily. You can add, edit, delete, view, and search for notes directly from the command line.

## Features

- **Add a Note**: Create a new note with a title and description.
- **Edit your Notes**: Modify the details of an existing note.
- **Delete a Note**: Remove a note by its ID.
- **View your Notes**: Display all your notes.
- **Search for a Note**: Find notes by searching for keywords in their titles or descriptions.

## Getting Started

### Prerequisites

- Dart SDK installed on your machine. If you don't have it installed, you can download it from [here](https://dart.dev/get-dart).

### Installation

1. Clone the repository:
    ```sh
    git clone <repository_url>
    ```

2. Navigate to the project directory:
    ```sh
    cd note_app
    ```

3. Ensure all dependencies are installed by running:
    ```sh
    dart pub get
    ```

### Running the App

To run the Note App, execute the following command in the project directory:
```sh
dart run note_app.dart
```

### Usage

Upon running the application, you will be presented with a menu:

```
♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡
Note App
♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡

What would you like to do?
1. Add a Note
2. Edit your Notes
3. Delete a Note
4. View your Notes
5. Search for a Note
6. Exit
```

Choose an option by entering the corresponding number and follow the prompts.

#### Adding a Note

1. Select `1` to add a note.
2. Enter a title for your note (cannot be empty).
3. Enter a description for your note (cannot be empty).
4. You will be asked if you want to add another note. Enter `yes` to add more or `no` to return to the main menu.

#### Editing a Note

1. Select `2` to edit a note.
2. Enter the ID of the note you wish to edit.
3. Update the title and description as prompted.

#### Deleting a Note

1. Select `3` to delete a note.
2. Enter the ID of the note you wish to delete.

#### Viewing Notes

1. Select `4` to view all notes.

#### Searching for a Note

1. Select `5` to search for a note.
2. Enter a keyword to search for notes by title or description.
3. You will be asked if you want to search for another note. Enter `yes` to search again or `no` to return to the main menu.

#### Exiting the App

1. Select `6` to exit the application.


Enjoy managing your notes with Note App!