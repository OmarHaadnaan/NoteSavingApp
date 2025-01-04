import 'package:flutter/material.dart';
import 'package:note_categorization/model/note.dart';

class AddNoteScreen extends StatefulWidget {
  AddNoteScreen({super.key, required this.onSavingNote});

  final void Function(Note note) onSavingNote;
  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();

  final _describtionController = TextEditingController();

  Category selectedContegory = Category.exam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _describtionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Describtion",
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(),
                // color: Colors.red,
              ),
              alignment: Alignment.centerRight,
              child: DropdownButton(
                value: selectedContegory,
                items: Category.values
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.name.toUpperCase(),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    selectedContegory = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          widget.onSavingNote(Note(
              title: _titleController.text,
              describtion: _describtionController.text,
              category: selectedContegory));

          _titleController.clear();
          _describtionController.clear();
        },
        label: Text("Save"),
      ),
    );
  }
}
