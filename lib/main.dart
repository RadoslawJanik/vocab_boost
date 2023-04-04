import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/nav.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'VocabBoost',
      theme:ThemeData(
        primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,

        home: Nav(),
        );
  }
}
    
    
  

