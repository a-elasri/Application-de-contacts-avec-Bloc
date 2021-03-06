import 'package:contacts_api/bloc/news/news_state.dart';
import 'package:contacts_api/repositories/contact_repository.dart';
import 'package:contacts_api/repositories/message_repository.dart';
import 'package:contacts_api/repositories/news_repository.dart';
import 'package:contacts_api/ui/pages/contacts_page.dart';
import 'package:contacts_api/ui/pages/home_page.dart';
import 'package:contacts_api/ui/pages/messages_page.dart';
import 'package:contacts_api/ui/pages/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/contacts/contact_bloc.dart';
import 'bloc/contacts/contact_state.dart';
import 'bloc/messages/message_bloc.dart';
import 'bloc/messages/message_state.dart';
import 'bloc/messages/messages_event.dart';
import 'bloc/news/news_bloc.dart';
import 'bloc/news/news_event.dart';
import 'model/contact_model.dart';
import 'model/news_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>ContactBloc( ContactState(contacts: [], requestState: RequestState.NONE, errorMessage: ""), ContactRepository())),
          BlocProvider(create: (context)=>MessageBloc(initialState: MessageState(messages: [],currentEvent: ContactMessagesEvent(contact: Contact())), messageRepository: MessageRepository()),),
          BlocProvider(create: (context)=>NewsBloc(initialState: NewsState(news: [], requestState: RequestState.NONE, errorMessage: "", currentEvent: SearchEvent(key: "tesla",date: "2022-03-06")), newsRepository: NewsRepository()))

        ],
        child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.green
          ),
          routes: {
            "/":(context)=>Home(),
            "/contacts":(context)=> ContactPage(),
            "/messages":(context)=>MessagesPage(),
            "/news":(context)=>NewsArticles(),

          },
        ));
  }
}
