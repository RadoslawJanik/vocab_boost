
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:vocab_boost/key.dart';
import 'dart:convert';

import '../../../models/Word.dart';

var now =  DateTime.now();

var formatter =  DateFormat('yyyy-MM-dd');
String today = formatter.format(now);

final String url =
'https://api.wordnik.com/v4/words.json/wordOfTheDay?date=$today&api_key=$apiKey' ;



Future<Word> fetchWord() async {
  final response = await http
      .get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Word.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Word');
  }
}


class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  late Future<Word>futureWord;

  @override

  void initState(){
    super.initState();
    futureWord = fetchWord();
  }
  Widget build(BuildContext context) {
    return Container(
      height: 470.0,
      child: Card(
        margin: EdgeInsets.fromLTRB(16,16,16,16),
        elevation: 4.0,
        child: Padding(padding: EdgeInsets.all(12.0),
        child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [FutureBuilder<Word>(future: futureWord,
        builder:(context,snapshot){
          if (snapshot.hasData){
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('${snapshot.data!.word[0].toUpperCase()}${snapshot.data!.word.substring(1)}', style: TextStyle(fontSize: 45, fontFamily:'Roboto',fontWeight: FontWeight.w400,color: Colors.black),),
                  const Icon(Icons.mic,
                  size: 35.0,)],
                ),
                Text(
                          snapshot.data!.definitions[0].partOfSpeech,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                          ),
                          SizedBox(height: 10,),
                 Text(
                          snapshot.data!.definitions[0].text,
                           style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          )
              ],
            );
          }else if (snapshot.hasError){
            return const Text('could not fetch your word');
          }
          return Center(child: CircularProgressIndicator(),);
        } ,),],)),
        
      ),
    );
  }
}