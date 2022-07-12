import 'package:flutter/material.dart';

class NavBarMenu extends StatelessWidget {
  const NavBarMenu({Key? key, required this.empty}) : super(key: key);
  final bool empty;

  @override
  Widget build(BuildContext context) {
    if (empty) {
      return Container(
        color: Colors.lightBlueAccent.withOpacity(0.2),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q='),
                  ),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.input),
                title: const Text("Welcome Hello"),
                onTap: () => {},
              ),
              ListTile(
                leading: const Icon(Icons.verified_user),
                title: const Text('Profile'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: const Icon(Icons.border_color),
                title: const Text('Feedback'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Logout'),
                onTap: () => {Navigator.of(context).pop()},
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
