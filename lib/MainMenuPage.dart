import 'package:flutter/material.dart';
import 'form/FormPage.dart';
import 'list/ListPage.dart';

class MainMenuPage extends StatefulWidget {
  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplos en Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Bienvenidos!',
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ),
            Container(
              height: 22.0,
            ),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed(FORM_PAGE_ROUTE);
              },
              child: Text(
                'Formulario de Carga',
              ),
            ),
            Container(
              height: 22.0,
            ),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed(LIST_PAGE_ROUTE);
              },
              child: const Text(
                'Ver autos cargados',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
