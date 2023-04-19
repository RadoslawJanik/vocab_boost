

class Definition{

  String text;
  String partOfSpeech;

  Definition({required this.text,required this.partOfSpeech});

 factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      
      text: json['text'],
      partOfSpeech: json["partOfSpeech"]
    );
  }
}
