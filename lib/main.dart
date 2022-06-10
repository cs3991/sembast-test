import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/book_cubit.dart';

import 'book.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books Library',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff593cd9)),
      ),
      home: BlocProvider(
        create: (BuildContext context) => BookCubit(),
        child: const BookListView(),
      ),
    );
  }
}

class BookListView extends StatelessWidget {
  const BookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books Library'),
      ),
      body: BlocBuilder<BookCubit, List<Book>>(
        builder: (BuildContext context, List<Book> bookList) {
          return ListView.builder(
            itemCount: bookList.length,
            itemBuilder: (BuildContext context, int index) {
              final book = bookList[index];
              return ListTile(
                title: Text(book.title),
                subtitle: Text(book.id.toString()),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => BlocProvider.of<BookCubit>(context)
                      .deleteBook(book),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => BlocProvider.of<BookCubit>(context).insertBook(
          Book(
            title: 'New Book',
          ),
        ),
      ),
    );
  }
}
