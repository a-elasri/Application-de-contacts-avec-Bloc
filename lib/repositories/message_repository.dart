

import 'dart:math';

import '../model/message_model.dart';

class MessageRepository{
  List<Message> messages=[
    Message(id: 1, content: "Bonjour Ahmed", idContact: 1, sent: true),
    Message(id: 2, content: "Bonjour",idContact: 1, sent: false),
    Message(id: 3, content: "Bonsoir ", idContact: 2, sent: true),
    Message(id: 4, content: "Tout va bien !!", idContact: 2, sent: true),
    Message(id: 5, content: "Salut", idContact: 2, sent: false),
    Message(id: 6, content: "Je vais bien", idContact: 2, sent: false),
  ];

  Future<List<Message>> messagesByContact(int idContact)async{
    var future= await Future.delayed(Duration(seconds: 1));
    int rand=new Random().nextInt(10);
    if(rand>3){
      return messages.where((element) => element.idContact==idContact).toList();
    }else{
      throw Exception("Erreur de chargement des contacts");
    }

  }

  Future<Message> addMessage(Message message)async{
    var future= await Future.delayed(Duration(seconds: 1));
    int rand=new Random().nextInt(10);
    if(rand>3){
      message.id=messages.length+1;
      messages.add(message);
      return message;
    }else{
      throw Exception("Erreur de chargement des contacts");
    }

  }

}

