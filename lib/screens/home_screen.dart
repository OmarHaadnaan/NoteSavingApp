import 'package:flutter/material.dart';
import 'package:note_categorization/model/note.dart';
import 'package:note_categorization/screens/add_note_screen.dart';
import 'package:note_categorization/screens/show_data_under_category.dart';
import 'package:note_categorization/widgets/note_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> allcategories = [];
  List<Note> myNotes = [];

  void saveData(Note note) {
    final isExistingCategory = allcategories.contains(note.category); //f
    if (isExistingCategory) {
      setState(() {
        myNotes.add(note);
      });
    } else {
      setState(() {
        allcategories.add(note.category);
        myNotes.add(note);
      });
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Successfully saved")));

    // for (int i = 0; i < allcategories.length; i++) {
    //   print(allcategories[i].name);
    // }

    // print("**************");
    // for (int i = 0; i < myNotes.length; i++) {
    //   print(myNotes[i].title);
    //   print(myNotes[i].describtion);
    //   print(myNotes[i].category);
    // }
  }

  void _selectNotCategory(Category category) {
    List<Note> filteredNotes = [];

    for (int i = 0; i < myNotes.length; i++) {
      if (myNotes[i].category == category) {
        filteredNotes.add(myNotes[i]);
      }
    }

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayNotes(note: filteredNotes),
        ));
  }

  void _navigateToTheAddNoteScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddNoteScreen(
            onSavingNote: saveData,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 120, 176),
        title: const Text(
          "Organize your Notes",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 26,
        ),
        itemCount: allcategories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 15,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (context, index) {
          return NoteItem(
            allcategories: allcategories[index],
            onselectnote: () {
              _selectNotCategory(allcategories[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 0, 120, 176),
        onPressed: () {
          _navigateToTheAddNoteScreen(context);
        },
        label: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
