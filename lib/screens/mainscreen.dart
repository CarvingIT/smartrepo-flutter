import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:smartrepoapp/screens/settingsscreen.dart';
import 'package:smartrepoapp/widgets/urllist.dart';
import '../providers/url.dart';
import '../providers/app_storage.dart';
import 'package:smartrepoapp/screens/aboutscreen.dart';
import 'package:smartrepoapp/widgets/newurl.dart';

import 'jsonscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Url> _repositories = [
    Url(id: '1', url: 'https://www.google.com'),
    Url(id: '2', url: 'https://www.google.co.in'),
    Url(id: '3', url: 'https://www.youtube.com'),
  ];
  // final List _repositories = [];
  // final List temp = [];
  List sitesList = [];

  Future<List> repos() async {
    var siteStore = AppStorage();
    var fileContent = siteStore.readFile('sr_sites.txt');
    var jsonfileContent = siteStore.readFile('myJsonFile.json');
    String sites = '';
    String jsonSites = '';

    await jsonfileContent.then(
      (value) {
        sites = value;
        // print('sites');
        // print(sites);
        try {
          var siteJson = json.decode(sites);
          print('JSON');
          print(siteJson);
          sitesList = List.from(siteJson);
        } catch (e) {
          print(e);
          print('Something went wrong somewhere');
        }
        // print(sitesList);
        // return sitesList;
      },
    );
    // print(sitesList);

    return sitesList;
  }

  void _addNewUrl(String url) async {
    //Can change th id required. For testing purposes used the following id.
    final newUrl = Url(id: DateTime.now().toString(), url: url);
    var repoList = await repos();
    print('Yes done it');
    print(repoList);

    setState(() {
      // sitesList.add(newUrl);
      repoList.add(newUrl.url);
      // repoList.add(newUrl.id);
      print(newUrl.id);
      print(repoList);
      // _repositories.add(newUrl);
    });
  }

// Does not delete in the sr_sites.txt
  void _deleteUrl(String id) async {
    var repoList = await repos();
    setState(() {
      _repositories.removeWhere((repo) {
        return repo.id == id;
      });
    });
  }

  void _newUrl(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewUrl(_addNewUrl),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // List repoList = repos();
    // print(repoList);
    final Future<String> _calculation = Future<String>.delayed(
      const Duration(seconds: 2),
      () => 'Data Loaded',
    );
    // read sites
    // var siteStore = AppStorage();
    // Future<String> fileContent = siteStore.readFile('sr_sites.txt');

    final PreferredSizeWidget appBar = AppBar(
      title: const Text(
        'Welcome To Smart Repo',
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => _newUrl(context),
        ),
      ],
    );

    final urlListWidget = SizedBox(
      height: (MediaQuery.of(context).size.height -
          appBar.preferredSize.height -
          MediaQuery.of(context).padding.top),
      // child: UrlList(_repositories, _deleteUrl),
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // return UrlList(_repositories, _deleteUrl);
            return ListView.builder(
              itemCount: sitesList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  elevation: 1,
                  child: ListTile(
                    title: Text('${sitesList[index]}'),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
        future: repos(),
      ),
    );

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [urlListWidget],
        ),
      ),
    );

    final drawer = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text(
              'Smart Repo',
              textAlign: TextAlign.left,
            ),
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).pushNamed(SettingsScreen.routeName);
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.of(context).pushNamed(AboutScreen.routeName);
            },
          ),
          ListTile(
            title: Text('JSON'),
            onTap: () {
              Navigator.of(context).pushNamed(JsonScreen.routeName);
            },
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: pageBody,
      drawer: drawer,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _newUrl(context),
      ),
    );
  }
}
