import 'package:flutter/material.dart';
import 'package:spend_tracker/pages/home/widgets/custom_text.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: 40,
          color: Colors.yellow,
          ),
        centerTitle: false,
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            tooltip: 'add', 
            onPressed: () => print('click'),
            ),
          IconButton(
            icon: Icon(Icons.update), 
            tooltip: 'update', 
            onPressed: () => print('click'),
            ),
        ],
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        const Text('one',
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Verdana',
            color: Colors.green,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline
            ),  
        ),
        const Text('    '),
        const CustomText(text: 'two'),
        const Text('    '),
        const Text('three',
        style: TextStyle(
          decoration: TextDecoration.lineThrough,
          fontSize: 60,
          color: Colors.red,
          ),
        ),
        Image.network(
          'https://avatars3.githubusercontent.com/u/512032?s=460&v=4',
          height: 300,
        )
      ],
      )),
    );
  }
}