import 'dart:convert';
// import 'dart:ffi';
// import 'dart:html';

import 'package:app/user_details.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  List<UserModel> pokemonData = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('Assets/Pokemon.json');
    final data = await json.decode(response) as List;
    List<UserModel> mappedData =
        data.map((e) => UserModel.fromJson(e)).toList();
    // print(data.toString());
    // print('${mappedData}===');
    setState(() {
      pokemonData = mappedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // decoration: BoxDecoration(color: Colors.amber),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => {readJson()},
                    child: const Text('Convert'),
                  ),
                ],
              ),
            ),
            pokemonData.isEmpty
                ? Container()
                : Container(
                    height: 500,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pokemonData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: (Text(pokemonData[index].name?.english ?? '')),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
