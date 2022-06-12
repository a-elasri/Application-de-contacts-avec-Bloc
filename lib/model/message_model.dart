class Message{
  int id;
  String content;
  int idContact;
  bool sent;
  Message({ this.id=0,required this.content,required this.idContact,required this.sent});
}