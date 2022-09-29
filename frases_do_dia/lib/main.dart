import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frases do dia',
      theme: ThemeData(
          primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Frases do dia'),
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
  var lista = ["In at mi dapibus", "euismod nulla nec", "feugiat quam.", "Proin a est non arcu aliquet faucibus ut non urna.", "Praesent sit amet nulla vitae sem dapibus auctor.", "Etiam mattis nisl a convallis auctor."];
  var varText="";
  void gerarFrase(){
    setState(() {
      varText = lista[Random().nextInt(5)];
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
            Image(
              image: AssetImage('lib/img/logo.png'),
              width: 400,
            ),
            Text(
              varText,
            ),
            ElevatedButton(
              onPressed: () {
                gerarFrase();
              },
              child: const Text('Gerar frase'),
            )
          ],
        ),
      ),
    );
  }
}
