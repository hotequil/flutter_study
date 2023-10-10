import 'package:flutter/material.dart';

import 'my_home_page.dart';
// TODO: remove -> const MyHomePage(title: 'Flutter study')

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter study',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Card(
        child: Column(
          children: <Widget>[
            blueText('FIAP', color: Colors.red),
            blueText('hotequil'),
            blueText('deborah'),
          ],
        ),
      ),
    );
  }

  blueText(String text, { Color color = Colors.lightBlue }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 32,
        ),
      ),
    );
  }
}
