import 'package:flutter/material.dart';

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
              child: Text(
                'Bienvenidos!',
                style: TextStyle(fontSize: 22.0),
              ),
            )),
            new RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {},
              child: new Text(
                'Formulario de Carga',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
