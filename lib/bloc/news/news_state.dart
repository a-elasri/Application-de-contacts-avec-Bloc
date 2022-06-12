import '../contacts/contact_state.dart';
import 'news_event.dart';

class NewsState{
  var news;
  RequestState requestState;
  String errorMessage;
  NewsEvent currentEvent;
  NewsState({required this.news, this.requestState=RequestState.NONE, this.errorMessage="",required this.currentEvent});
}