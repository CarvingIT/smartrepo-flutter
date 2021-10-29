import 'package:flutter/material.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Smart Repository',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Smart Repository'),
		  centerTitle:true,
		  actions:[
			PopupMenuButton<int>(
				onSelected: (item) => onSelected(context, item),
				itemBuilder: (context) => [
					PopupMenuItem<int>(
						value:0,
						child: Text('Settings'),
					),
					PopupMenuItem<int>(
						value:1,
						child: Text('About'),
					),
				],
			),
		  ],
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ), // Scaffold
    );
  } // widget 

	  void onSelected(BuildContext context, int item){
			switch (item) {
				case 0: 
				print('Clicked setting');
				break;
				case 1: 
				print('Clicked about');
				break;
			}
	  }
}
