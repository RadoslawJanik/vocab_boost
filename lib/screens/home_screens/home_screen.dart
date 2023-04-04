import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import 'Components/main.dart';
import 'Components/top_section.dart';

class Home extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [TopSection(),Main()],),
    );
  }
}