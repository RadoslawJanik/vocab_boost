import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/home_screens/home_screen.dart';
import 'drawer.dart';


class Nav extends StatefulWidget {
 

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {

  int _selectedIndex=0;
  static List<Widget> _widgetOptions = <Widget>[
  Home(),
  Text('Past Words')
  ];

  void _onItemTapped(int index){
    setState(() {
     _selectedIndex = index; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('VocabBoost'),
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.favorite,), onPressed: () {  },)
        ],
      ),
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items:  const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
            ),
            label:'VCB',),

            BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.calendarWeek,),
            label:'Past Words',)
      
        ],

        selectedItemColor: Colors.white,
        selectedFontSize: 16.0,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 12.0,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),


    );
  }
}