class Note {
  String title;
  String describtion;

  Category category;

  Note(
      {required this.title, required this.describtion, required this.category});
}

enum Category {
  exam,
  exercie,
  project,
}
