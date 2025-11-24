import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  @override
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ChangeNotifierProvider(create: (_) => provider()));
  }
}

class HomePage extends StatelessWidget {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App_Provider State Management'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Text('${Provider.of<provider>(context, listen: true).get()}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<provider>(context, listen: false).increment();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
    );
  }
}
