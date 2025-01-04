import 'package:flutter/material.dart';
import 'package:note_categorization/model/note.dart';
import 'package:note_categorization/screens/show_details.dart';

class DisplayNotes extends StatelessWidget {
  const DisplayNotes({
    super.key,
    required this.note,
  });

  final List<Note> note;

  @override
  Widget build(BuildContext context) {
    // for (int i = 0; i < note.length; i++) {
    //   print(note[i].title);
    //   print(note[i].describtion);
    //   print(note[i].category);
    // }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 120, 176),
        foregroundColor: Colors.white,
        title: const Text(
          'Display notes',
        ),
      ),
      body: ListView.builder(
        itemCount: note.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowDetails(
                      note: note[index],
                    ),
                  ));
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              color: const Color.fromARGB(255, 181, 229, 251),
              child: ListTile(
                title: Text(
                  note[index].title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  note[index].describtion,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
