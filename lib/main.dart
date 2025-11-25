import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/ListMapAccess.dart';
import 'package:state_management/ListMapProvider.dart';
import 'package:state_management/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  @override
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => provider()),
          ChangeNotifierProvider(create: (_) => ListMapProvider()), // un necessary but add just to understand the syntax
        ],
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
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
        child: Consumer<provider>(
          builder: (ctx, _, __) {
            return Text('${Provider.of<provider>(ctx, listen: true).get()}');
            // Instead of using Listen true , we can use ctx.watch<provider>().get()
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<provider>(context, listen: false).increment();
              // Instead of using Listen false , we can use ctx.read<provider>().get()
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.pinkAccent,
            foregroundColor: Colors.white,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<provider>().decrement();
            },
            child: Icon(Icons.remove),
            backgroundColor: Colors.pinkAccent,
            foregroundColor: Colors.white,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangeNotifierProvider<ListMapProvider>(
                  create: (_)=>ListMapProvider(),
                  child: ListMapfetch(),
                )),
              );
            },
            child: Icon(Icons.arrow_right),
            backgroundColor: Colors.pinkAccent,
            foregroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
