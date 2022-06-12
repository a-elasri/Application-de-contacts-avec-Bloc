import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Home"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.pushNamed(context, "/menu");
        },
        label: Text("Menu"),
        icon: Icon(Icons.menu),
      ),
      body:Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/image6.jpg"),
              fit: BoxFit.cover,
            )
        ),
        child: null,

      ),
    );

  }

}