import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/book_cubit.dart';
import 'package:test_flutter/home_page.dart';

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
        child: HomePageBis(),
      ),
    );
  }
}

