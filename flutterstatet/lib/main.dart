import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterstatet/state_notifier_kullanimi.dart';

void main() {
  runApp(const ProviderScope(child: StateNotifierKullanimi()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const MyText(),
              MyCounterText(
                sayac: _counter,
              ),
            ],
          ),
        ),
        floatingActionButton: MyFloatingActionButton(
          onArttir: () {
            _counter++;
            setState(() {});
          },
        ));
  }
}

class MyCounterText extends StatelessWidget {
  final int sayac;
  const MyCounterText({super.key, required this.sayac});

  @override
  Widget build(BuildContext context) {
    return Text(
      sayac.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You have pushed the button this many times:',
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  VoidCallback onArttir;
  MyFloatingActionButton({super.key, required this.onArttir});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onArttir();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
