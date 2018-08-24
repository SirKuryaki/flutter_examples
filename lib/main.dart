import 'package:flutter/material.dart';
import 'MainMenuPage.dart';
import 'form/FormPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primaryColor: Colors.grey.shade700,
        ),
        home: MainMenuPage(),
        routes: {
          FORM_PAGE_ROUTE: (BuildContext context) => FormPage(),
        });
  }
}
