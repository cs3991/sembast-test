import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book.dart';
import 'book_cubit.dart';
import 'book_list.dart';

class HomePageBis extends StatelessWidget {
  HomePageBis({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books Entry Page"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              textAlign: TextAlign.start,
              onFieldSubmitted: (val) {},
              style: TextStyle(),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Add Book Name",
                labelStyle: TextStyle(
                  fontSize: 17,
                ),
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.7),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.7),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 100,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  BlocProvider.of<BookCubit>(context)
                      .insertBook(Book(title: nameController.text));
                  nameController.clear();
                },
                color: Colors.blue,
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 120,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  var cubit = context.read<BookCubit>();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: cubit,
                        child: BookListView(context),
                      ),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: Colors.blue,
                child: Text(
                  "See the List",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
