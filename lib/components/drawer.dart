import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(children: [Container(height: 70, child: DrawerHeader(child: Text('VocabBoost',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,))))]),
    );
  }
}