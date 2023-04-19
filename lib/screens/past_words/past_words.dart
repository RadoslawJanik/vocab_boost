import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:vocab_boost/screens/past_words/components/top_section.dart';
import 'package:vocab_boost/screens/past_words/components/Main.dart';
class PastWords extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          TopSection(),
          Main(),
        ],
      ),
    );
  }
}