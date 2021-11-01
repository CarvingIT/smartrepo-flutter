import 'package:flutter/material.dart';
// settings screen
class SmartRepoSettings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
	  	  leading: BackButton(
			onPressed: () => Navigator.of(context).pop(),
		  ),
		  centerTitle:true,
        ),
        body: const Center(
          child: Text('Settings here'),
        ),
      ), // Scaffold
    );
  } // widget 
}

