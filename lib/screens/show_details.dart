import 'package:flutter/material.dart';
import 'package:note_categorization/model/note.dart';

class ShowDetails extends StatelessWidget {
  const ShowDetails({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 120, 176),
        foregroundColor: Colors.white,
        title: const Text("Note Details"),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                note.describtion,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 18,
                  //fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
