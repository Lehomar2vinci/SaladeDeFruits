import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pomme, Poire et Ananas ",
      theme: ThemeData(
        fontFamily: 'Ysabeau-Black',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(189, 5, 25, 136)),
        useMaterial3: true,
      ),
      home: const MyHomePage(
          title:
              "Poire Ananas (fruit de la passion (c'est bon francky, c'est bon))"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<int> _items = [];

  bool _isPrime(int n) {
    if (n <= 1) {
      return false;
    }
    for (int i = 2; i <= sqrt(n); i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }

  Widget _getImageForValue(int value) {
    if (_isPrime(value)) {
      return Image.asset('images/ananas.png');
    } else {
      if (value % 2 == 0) {
        return Image.asset('images/poire.png');
      } else {
        return Image.asset('images/pomme.png');
      }
    }
  }

  Color _getColorForValue(int value) {
    if (_isPrime(value)) {
      return Colors.cyan;
    } else {
      if (value % 2 == 0) {
        return Colors.cyan[300]!;
      } else {
        return Colors.indigo[300]!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          final int value = _items[index];
          return Container(
            color: _getColorForValue(value),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _getImageForValue(value),
                ),
                Text(
                  value.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _items.add(_counter++);
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
