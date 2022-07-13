import 'package:flutter/material.dart';
import 'package:todo/menu.dart';
import 'package:todo/todo_maker.dart';
import 'package:todo/make_todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
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
  int _selectedIndex = 1;

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
      duration: const Duration(
        milliseconds: 1500,
      ),
      content: const Text(
        'Welcome to India!',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.blueAccent.shade400,
      action: SnackBarAction(
        label: 'Okay!',
        textColor: Colors.white,
        onPressed: _incrementCounter,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  NavBarMenu _makeMenu() {
    _incrementCounter();
    _hideDrawer = false;
    return const NavBarMenu(empty: true);
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AboutPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  static final List<Widget> _options = <Widget>[
    Container(
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
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const AboutPage();
                  //     },
                  //   ),
                  // );
                  // _incrementCounter();
                  () {};
                },
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
                onPressed: () {},
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
                onPressed: () {},
                icon: const Icon(Icons.settings),
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    )
  ];

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
              child: Stack(
                children: <Widget>[
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const ListTodo(),
                ],
              ),
            ),
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
            onPressed: () {
              _incrementCounter();
              Navigator.of(context).push(_createRoute());
            },
            tooltip: 'A new task',
            child: const Icon(Icons.edit),
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.red,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.yellow,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
