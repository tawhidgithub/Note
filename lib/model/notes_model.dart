class NotesModle {
  final String title;
  final int? id;
  final dynamic description;
  NotesModle({this.id, required this.title, required this.description});

  NotesModle.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        description = res["discription"];

  Map<String, Object?> toMap() {
    return {"id": id, "title": title, "discription": description};
  }
}
