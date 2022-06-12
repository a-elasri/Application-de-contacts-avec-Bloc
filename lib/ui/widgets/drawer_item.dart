import 'package:contacts_api/bloc/contacts/contact_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contacts/contact_bloc.dart';
import '../../bloc/news/news_bloc.dart';


class DrawerItem extends StatelessWidget{
  String route;
  String title;
  Icon icon;
  DrawerItem(this.title,this.route,this.icon);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        if(route=="/contact")
        {
          context.read<ContactBloc>().add(LoadAllContactsEvent());
        }
        if(route=="/news")
        {
          context.read<NewsBloc>();
        }
        Navigator.pushNamed(context, route);
      },
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.green),
      ),
    );
  }

}