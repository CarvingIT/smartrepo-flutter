import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
		  TextFormField(
 			// The validator receives the text that the user has entered.
			decoration: const InputDecoration(
				labelText: 'Smart Repository URL *',
				hintText: 'Base URL of your new Smart Repository site',
			),
  		  	validator: (value) {
    		if (value == null || value.isEmpty) {
      		return 'Please enter some text';
    		}
    		return null;
   		},
		),
		ElevatedButton(
  		onPressed: () {
    		// Validate returns true if the form is valid, or false otherwise.
    		if (_formKey.currentState!.validate()) {
      		// If the form is valid, display a snackbar. In the real world,
      		// you'd often call a server or save the information in a database.
      		ScaffoldMessenger.of(context).showSnackBar(
        		const SnackBar(content: Text('Adding your site...')),
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
