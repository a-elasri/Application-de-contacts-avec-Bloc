
import 'package:bloc/bloc.dart';


import '../../model/contact_model.dart';
import '../../repositories/contact_repository.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent,ContactState>{
  ContactRepository contactRepository;
  String lastEvent="";
  ContactBloc(ContactState contactState, this.contactRepository):super(contactState){
    on<ContactEvent>((event, emit) async{
      if(event is LoadAllContactsEvent){
        lastEvent="All";
        emit(ContactState(contacts: [],requestState: RequestState.Loading,errorMessage: ""));
        try{
          List<Contact> contacts= await contactRepository.allContacts();
          emit(ContactState(contacts: contacts,requestState: RequestState.Loaded,errorMessage: ""));
        }catch(e){
          emit(ContactState(contacts: [],requestState: RequestState.Error,errorMessage: e.toString()));
        }

      }else if(event is LoadBDDCContactsEvent){
        lastEvent="BDDC";
        emit(ContactState(contacts: [],requestState: RequestState.Loading,errorMessage: ""));
        try{
          List<Contact> contacts= await contactRepository.contactsByGroup("BDDC");
          emit(ContactState(contacts: contacts,requestState: RequestState.Loaded,errorMessage: ""));
        }catch(e){
          emit(ContactState(contacts: [],requestState: RequestState.Error,errorMessage: e.toString()));
        }
      }else if(event is LoadGLSIDConctactsEvent){
        lastEvent="GLSID";
        try{
          emit(ContactState(contacts: [],requestState: RequestState.Loading,errorMessage: ""));
          List<Contact> contacts= await contactRepository.contactsByGroup("GLSID");
          emit(ContactState(contacts: contacts,requestState: RequestState.Loaded,errorMessage: ""));
        }catch(e){
          emit(ContactState(contacts: [],requestState: RequestState.Error,errorMessage: e.toString()));
        }
      }
    });
  }


}