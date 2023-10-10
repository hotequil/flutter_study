import 'package:flutter/foundation.dart';
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FIAP'),
        ),
        body: restaurantList(),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Floating button',
          child: const Icon(Icons.car_crash),
          onPressed: (){
            if (kDebugMode) {
              print('Button clicked');
            }
          },
        ),
      ),
    );
  }

  restaurantList(){
    return Card(
        child: ListView(
          children: [
            tile(
                'Tip Tim Lanches',
                'R. República Argentina, 74 - Ponta Aguda, Blumenau - SC, 89050-100',
                '9.5'
            ),
            tile(
                'Burger Bravo',
                'R. Francisco Vahldieck, 3245 - Fortaleza, Blumenau - SC, 89057-001',
                '9'
            ),
          ],
        )
    );
  }

  tile(String title, String subtitle, String rating){
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: const Icon(Icons.place),
      trailing: Text(rating),
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
