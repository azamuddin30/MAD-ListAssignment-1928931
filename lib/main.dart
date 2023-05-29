import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class Fruits {
  String? name;
  String? filePath;

  Fruits({this.name, this.filePath});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _inputController = TextEditingController();
  final List<Fruits> _fruitBasket = [
    Fruits(name: "apple", filePath: "assets/images/apple.jpg"),
    Fruits(name: "cherry", filePath: "assets/images/cherry.jpg"),
    Fruits(name: "pineapple", filePath: "assets/images/pineapple.jpg"),
    Fruits(name: "strawberry", filePath: "assets/images/strawberry.jpg"),
    Fruits(name: "tangerine", filePath: "assets/images/tangerine.jpg")
  ];

  String? _myImagePath = "";
  Image _myImage = Image.asset("assets/images/basket.jpg");

  void setImage() {
    setState(() {
      _myImagePath = _fruitBasket
          .firstWhere((target) => target.name == _inputController.text)
          .filePath;
      _myImage = Image.asset(_myImagePath!);
    });
  }

  void setRandomImage() {
    setState(() {
      final random = Random();
      _myImagePath = _fruitBasket[random.nextInt(_fruitBasket.length)].filePath;
      _myImage = Image.asset(_myImagePath!);
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(11.0),
              child: _myImage,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(11.0),
              child: const Text(
                  " Menu : apple,cherry,pineapple,strawberry,tangerine"),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: TextField(
                controller: _inputController,
                decoration: const InputDecoration(hintText: 'Enter something'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: setImage, child: const Text("Display Choice")),
                  ElevatedButton(
                      onPressed: setRandomImage,
                      child: const Text("I'm Feeling Lucky")),
                ],
              ),
            ),
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
