
import 'dart:math';

import '../model/contact_model.dart';


class ContactRepository{
  List<Contact> contacts=[
    Contact(id: 1, name: "Majda", group: "GLSID", profile: "AH"),
    Contact(id: 2, name: "Imane", group: "BDDC", profile: "IM"),
    Contact(id: 3, name: "Khadija", group: "BDCC", profile: "RA"),
    Contact(id: 4, name: "Hind", group: "BDDC", profile: "KA"),
    Contact(id: 5, name: "Hajar", group: "GLSID", profile: "Ha"),
    Contact(id: 6, name: "Zakaria", group: "GLSID", profile: "As"),
  ];

  Future<List<Contact>> allContacts()async{
    var future= await Future.delayed(Duration(seconds: 1));
    int rand=new Random().nextInt(10);
    if(rand>5){
      return contacts;
    }else{
      throw Exception("Erreur de chargement des contacts");
    }

  }
  Future<List<Contact>> contactsByGroup(String group)async{
    var future= await Future.delayed(Duration(seconds: 1));
    int rand=new Random().nextInt(10);
    if(rand>5){
      return contacts.where((element) => element.group==group).toList();
    }else{
      throw Exception("Erreur de chargement des contacts");
    }

  }
}