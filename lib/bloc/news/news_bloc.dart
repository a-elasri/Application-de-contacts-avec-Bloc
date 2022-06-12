import 'package:bloc/bloc.dart';
import '../../repositories/news_repository.dart';
import '../contacts/contact_state.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent,NewsState> {
  NewsRepository newsRepository;
  NewsBloc({required NewsState initialState, required this.newsRepository})
      : super(initialState) {
    on<SearchEvent>((event, emit) async {

        var news = await newsRepository.searchNews(event.key, event.date);
        emit(NewsState(news: news,requestState: RequestState.Loaded,errorMessage: "",currentEvent: event));

    });
  }
}

