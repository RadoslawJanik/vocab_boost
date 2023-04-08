

class Definition{
  String source ;
  String text;
  String partOfSpeech;

  Definition({required this.source,required this.text,required this.partOfSpeech});

 factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      source: json['source'],
      text: json['text'],
      partOfSpeech: json["partOfSpeech"]
    );
  }
}
