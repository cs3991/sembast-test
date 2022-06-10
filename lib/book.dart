class Book {
  String title;
  int id;

  Book({required this.title}) : id = 0;

  Book.withId({required this.title, required this.id});

  static Book fromJson(Map<String, dynamic> json, id) {
    return Book.withId(title: json['title'], id: id);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
    };
  }

  @override
  String toString() {
    return 'Book{title: $title, id: $id}';
  }
}
