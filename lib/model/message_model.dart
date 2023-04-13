class Message {
  final String text;

  Message(this.text);

  factory Message.fromJson(jsonData) {
    return Message(jsonData['Message']);
  }
}
