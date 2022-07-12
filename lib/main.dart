import 'package:flutter/material.dart';
import 'package:todo/menu.dart';
import 'package:todo/todo_list_maker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'todo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _hideDrawer = true;
  late ScrollController _hideFloatAButton;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hideFloatAButton = new ScrollController();
    _hideFloatAButton.addListener(() {});
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _showSnackBar() {
    final snackBar = SnackBar(
      content: const Text(
        'Welcome to India!',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.blueAccent.shade400,
      action: SnackBarAction(
        label: 'Okay!',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  NavBarMenu _makeMenu() {
    _incrementCounter();
    _hideDrawer = true;
    return const NavBarMenu(empty: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: _makeMenu(),
      appBar: AppBar(
        automaticallyImplyLeading: _hideDrawer,
        title: TextButton(
          onPressed: () {
            _incrementCounter();
            _showSnackBar();
          },
          child: Text(
            widget.title,
            textScaleFactor: 1.45,
            style: const TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ),
            const listTodo(),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            elevation: 10,
            splashColor: Colors.green,
            backgroundColor: Colors.lightBlue,
            hoverColor: Colors.redAccent.shade200,
            onPressed: _incrementCounter,
            tooltip: 'A new task',
            child: const Icon(Icons.edit),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.8),
              blurRadius: 15.0,
              blurStyle: BlurStyle.normal,
            )
          ],
        ),
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.withOpacity(0.3),
                  border: Border.all(
                    width: 3,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 70,
                width: 100,
                child: IconButton(
                  onPressed: _incrementCounter,
                  icon: const Icon(Icons.person),
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 0,
              width: 1,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.withOpacity(0.3),
                  border: Border.all(
                    width: 3,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 70,
                width: 100,
                child: IconButton(
                  onPressed: _incrementCounter,
                  icon: const Icon(Icons.home),
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 0,
              width: 1,
            ),
            // Expanded(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.lightBlueAccent.withOpacity(0.2),
            //       border: Border.all(
            //         width: 3,
            //         style: BorderStyle.none,
            //       ),
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     height: 70,
            //     width: 100,
            //     child: IconButton(
            //       onPressed: _incrementCounter,
            //       icon: const Icon(
            //         Icons.list_alt,
            //         // size: 40,
            //       ),
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 0,
              width: 1,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.withOpacity(0.3),
                  border: Border.all(
                    width: 3,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 70,
                width: 100,
                child: IconButton(
                  onPressed: _incrementCounter,
                  icon: const Icon(Icons.settings),
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
