abstract class NewsEvent{
}


class SearchEvent extends NewsEvent{
  String key;
  String date;

  SearchEvent({required this.key,required this.date});
}

