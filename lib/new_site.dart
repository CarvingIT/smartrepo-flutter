import 'package:flutter/material.dart';
import './app_storage.dart';
import 'dart:convert';
import 'package:validators/validators.dart';

// settings screen
class NewSite extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Site',
      home: Scaffold(
        appBar: AppBar(
          title: Text('New Site'),
	  	  leading: BackButton(
			onPressed: () => Navigator.of(context).pop(),
		  ),
		  centerTitle:true,
        ),
        body: const NewSiteForm(), 
      ), // Scaffold
    );
  } // widget 
}


class NewSiteForm extends StatefulWidget {
  const NewSiteForm({Key? key}) : super(key: key);

  @override
  NewSiteFormState createState() {
    return NewSiteFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class NewSiteFormState extends State<NewSiteForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  TextEditingController siteUrl = TextEditingController();
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
		  TextFormField(
 			// The validator receives the text that the user has entered.
			controller: siteUrl,
			decoration: const InputDecoration(
				labelText: 'Smart Repository URL *',
				hintText: 'Base URL of your new Smart Repository site',
			),
  		  	validator: (value) {
    			//if (value == null || value.isEmpty) {
    			if (!isURL(value)) {
      			return 'Please enter a valid URL';
    		}
    		return null;
   		},
		),
		ElevatedButton(
  		onPressed: () {
    		// Validate returns true if the form is valid, or false otherwise.
    		if (_formKey.currentState!.validate()) {

			// read file 
			var site_store = new AppStorage();
			var file_content = site_store.readFile('sr_sites.txt');
			String sites = '';
			List<String> sites_list = [];
				file_content.then((value) {
					sites = value;

				// unserialize sites into a list, add the new siteUrl.text to it, serialize and then save
				//var sites_json = jsonDecode(sites);
				try{
				var sites_json = json.decode(sites);
				sites_list = List.from(sites_json);
				}
				catch(e, s){
					//logException(exception: e, stackTrace: s);
					print('Something went wrong somewhere');
				}
				sites_list.add(siteUrl.text);
				print(sites_list);
		 		// serialize and write to file	
				var sites_updated = jsonEncode(sites_list);
				site_store.writeFile('sr_sites.txt', sites_updated);

				});
	
				// show status of operation
      		ScaffoldMessenger.of(context).showSnackBar(
        		const SnackBar(content: Text('Saved ..')),
      		);
    		}
  		},
  		child: const Text('Submit'),
		),
        ],
      ),
    );
  }
}
