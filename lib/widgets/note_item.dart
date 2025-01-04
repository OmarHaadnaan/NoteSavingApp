import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_categorization/model/note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.allcategories,
    required this.onselectnote,
  });

  final Category allcategories;

  final void Function() onselectnote;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onselectnote,
      child: Container(
        decoration: BoxDecoration(
          color: allcategories.index.isEven ? Colors.blueAccent : Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Text(allcategories.name.toUpperCase(),
              style: GoogleFonts.zenTokyoZoo(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ),
      ),
    );
  }
}
