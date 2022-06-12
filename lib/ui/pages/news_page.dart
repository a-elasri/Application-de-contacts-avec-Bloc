import 'package:contacts_api/ui/pages/web_view_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../bloc/contacts/contact_state.dart';
import '../../bloc/news/news_bloc.dart';
import '../../bloc/news/news_event.dart';
import '../../bloc/news/news_state.dart';
import '../widgets/button_reload.dart';

class NewsArticles extends StatelessWidget{
   NewsState newsStat=NewsState(news: [], currentEvent: SearchEvent(key: "",date: ""));

  TextEditingController textEditingController=new TextEditingController();
  TextEditingController textEditingControllerDate=new TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text("News"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
              ),
            ),
            TextField(
              controller: textEditingControllerDate,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
              ),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              child: const Icon(Icons.search),
              onPressed: (){
    context.read<NewsBloc>().add(SearchEvent(key: textEditingController.text,date: textEditingControllerDate.text));
              },
            ),
            BlocBuilder<NewsBloc,NewsState>(
                builder: (context, state) {
                  if(state.requestState==RequestState.Loading){
                    return CircularProgressIndicator();
                  }else if(state.requestState==RequestState.Loaded){
                    return Expanded(
                        child:  ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.all(20.0),
                                  itemCount: 4,
                                  itemBuilder: (context,index){
                                    return ListTile(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context)=>
                                                WebViewNews(newsStat.news["articles"][index]["url"],
                                                    newsStat.news["articles"][index]["urlToImage"],
                                                    newsStat.news["articles"][index]["title"],
                                                    newsStat.news["articles"][index]["description"],
                                                    newsStat.news["articles"][index]["author"])
                                        ));
                                      },
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(newsStat.news["articles"][index]["urlToImage"].toString()),
                                      ),
                                      title: Text(newsStat.news["articles"][index]["title"]),
                                      subtitle: Text(newsStat.news["articles"][index]["publishedAt"]),
                                    );
                                  })
                        );
                  }else if(state.requestState==RequestState.Error){
                    return Column(
                      children: [
                        Text("${state.errorMessage}"),
                        ButtonReload(),
                      ],
                    );
                  }
                  else{
                    return Center(child: Text("Aucun élément"),);
                  }
                }),

          ],
        ),
      ),
    );
  }
}