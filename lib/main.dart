// import 'package:flutter/material.dart';
// import './settings.dart';
// import './new_site.dart';
// import './app_storage.dart';
// import 'dart:convert';

// void main() => runApp(SmartRepoApp());

// class SmartRepoApp extends StatelessWidget {
//   @override

// 	Widget build(BuildContext context) {
// 		return MaterialApp(
//       			title: 'Welcome to Smart Repository',
// 	  			home: Home(),
// 		);
//     } // widget

// }

// class Home extends StatelessWidget{
// 	@override
// 	List<String> sr_sites = [];
// 	Widget build(BuildContext context){
// 		return Scaffold(
//         appBar: AppBar(
//           title: Text('Welcome to Smart Repository'),
// 		  centerTitle:true,
// 		  actions:[
// 			PopupMenuButton<int>(
// 				onSelected: (item) => onSelected(context, item),
// 				itemBuilder: (context) => [
// 					PopupMenuItem<int>(
// 						value:0,
// 						child: Text('Settings'),
// 					),
// 					PopupMenuItem<int>(
// 						value:1,
// 						child: Text('About'),
// 					),
// 					PopupMenuItem<int>(
// 						value:2,
// 						child: Text('New Site'),
// 					),
// 				],
// 			),
// 		  ],
//         ),
//         body: SRSites(),
// 			/*
// 			Scrollbar(
// 		  child: ListView.builder(
// 		  itemCount: sr_sites.length,
// 		  itemBuilder: (context, index) {
//   			// read sites
// 			var site_store = new AppStorage();
//    			var file_content = site_store.readFile('sr_sites.txt');
//  			String sites = '';
//  			List<String> sites_list = [];
// 			var sites_container = Container(
// 				margin:EdgeInsets.all(10),
// 				width:50,
// 				height:100,
// 				child: Padding(
// 					padding: EdgeInsets.all(16.0),
// 					child:Card(
// 						color:Colors.yellow,
// 						child: Padding(
// 							padding: EdgeInsets.all(16.0),
// 							child:Text(sr_sites[index]),
// 						),
// 					),
// 				),
// 			);
//     		file_content.then((value){
//      			sites = value;
//      			var sites_json = json.decode(sites);
//      			sites_list = List.from(sites_json);
// 				print(sites_list);
//         	})
// 			.catchError((e) {
// 				print("Some error");
// 			})
// 			.whenComplete(() {
// 				// rebuild here
// 				sr_sites = sites_list;
// 				print('Need to rebuild home');
//   			}); // widget

// 			return sites_container;
//   			},
// 		),
// 		),
// 		*/
//       ); // Scaffold
// 	}

// 	  void onSelected(BuildContext context, int item){
// 			switch (item) {
// 				case 0:
// 				Navigator.of(context).push(
// 					MaterialPageRoute(builder: (context) => new SmartRepoSettings() ),
// 				);
// 				break;
// 				case 1:
// 				print('Clicked about');
// 				break;
// 				case 2:
// 				Navigator.of(context).push(
// 					MaterialPageRoute(builder: (context) => new NewSite() ),
// 				);
// 				break;
// 			}
// 	  }
// }

// class SRSites extends StatefulWidget {
// 	const SRSites({Key? key}) : super(key: key);
// 	@override
//     State<SRSites> createState() => _SRSitesState();
// }

// class _SRSitesState extends State<SRSites> {

//   @override
//   Widget build(BuildContext context) {
//   final Future<String> _calculation = Future<String>.delayed(
//     const Duration(seconds: 2),
//     () => 'Data Loaded',
//   );
// 	// read sites
// 	var site_store = new AppStorage();
//    	Future<String> file_content = site_store.readFile('sr_sites.txt');

//     return DefaultTextStyle(
//       style: Theme.of(context).textTheme.headline2!,
//       textAlign: TextAlign.center,
//       child: FutureBuilder<String>(
//         future: file_content, // a previously-obtained Future<String> or null
//         builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//           List<Widget> children;
//           if (snapshot.hasData) {
// 			print("Got data!");
//             children = <Widget>[
//               const Icon(
//                 Icons.check_circle_outline,
//                 color: Colors.green,
//                 size: 60,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 16),
//                 child: Text('Result: ${snapshot.data}'),
//               )
//             ];
//           } else if (snapshot.hasError) {
//             children = <Widget>[
//               const Icon(
//                 Icons.error_outline,
//                 color: Colors.red,
//                 size: 60,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 16),
//                 child: Text('Error: ${snapshot.error}'),
//               )
//             ];
//           } else {
//             children = const <Widget>[
//               SizedBox(
//                 child: CircularProgressIndicator(),
//                 width: 60,
//                 height: 60,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 16),
//                 child: Text('Awaiting result...'),
//               )
//             ];
//           }
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: children,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:smartrepoapp/screens/aboutscreen.dart';
import 'package:smartrepoapp/screens/jsonscreen.dart';
import 'package:smartrepoapp/screens/settingsscreen.dart';

import 'screens/mainscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Smart Repo',
      home: const MainScreen(),
      routes: {
        AboutScreen.routeName: (ctx) => const AboutScreen(),
        SettingsScreen.routeName: (ctx) => const SettingsScreen(),
        JsonScreen.routeName: (ctx) => JsonScreen(),
      },
    );
  }
}
