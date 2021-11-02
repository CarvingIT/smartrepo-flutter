import 'package:flutter/material.dart';
import './settings.dart';
import './new_site.dart';
import './app_storage.dart';

void main() => runApp(SmartRepoApp());

class SmartRepoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Smart Repository',
	  home: Home(),
    );
  } // widget 
}

class Home extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return Scaffold(
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
					PopupMenuItem<int>(
						value:2,
						child: Text('New Site'),
					),
				],
			),
		  ],
        ),
        body: const Center(
          child: Text('Home screen'),
        ),
      ); // Scaffold
	}

	  void onSelected(BuildContext context, int item){
			switch (item) {
				case 0: 
				Navigator.of(context).push(
					MaterialPageRoute(builder: (context) => new SmartRepoSettings() ),
				);
				break;
				case 1: 
				print('Clicked about');
				break;
				case 2: 
				Navigator.of(context).push(
					MaterialPageRoute(builder: (context) => new NewSite() ),
				);
				break;
			}
	  }
}
