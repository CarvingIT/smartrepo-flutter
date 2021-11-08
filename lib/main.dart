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
	final sr_sites = List<String>.generate(100, (i) => "Site $i");

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
        body: Scrollbar(
		  child: ListView.builder(
		  itemCount: sr_sites.length,
		  itemBuilder: (context, index) {
					return Container(
						margin:EdgeInsets.all(10),
						width:50,
						height:100,
						child: Padding(
							padding: EdgeInsets.all(16.0),
							child:Card(
								color:Colors.yellow,
								child: Padding(
									padding: EdgeInsets.all(16.0),
									child:Text(sr_sites[index]),
								),
							),
						),
					);
  			},
		),
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
