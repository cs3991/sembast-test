import 'package:bloc/bloc.dart';
import 'package:sembast/sembast.dart';
import 'package:test_flutter/app_database.dart';

import 'book.dart';

class BookCubit extends Cubit<List<Book>> {
  AppDatabase appDatabase = AppDatabase.instance;
  static const String folderName = "books";
  final _booksFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  BookCubit() : super(<Book>[]) {
    getBooks();
  }

  void getBooks() async {
    final recordSnapshot = await _booksFolder.find(await _db);
    var books = recordSnapshot.map((snapshot) {
      final book = Book.fromJson(snapshot.value, snapshot.key);
      return book;
    }).toList();
    emit(books);
  }

  void insertBook(Book book) async {
    await _booksFolder.add(await _db, book.toJson());
    getBooks();
  }

  void updateBooks(int id, Book book) async {
    final finder = Finder(filter: Filter.byKey(id));
    await _booksFolder.update(await _db, book.toJson(), finder: finder);
    getBooks();
  }

  void deleteBook(Book book) async {
    await _booksFolder.delete(await _db,
        finder: Finder(filter: Filter.byKey(book.id)));
    getBooks();
  }
}
