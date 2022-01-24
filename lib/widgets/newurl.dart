import 'package:flutter/material.dart';
import 'package:smartrepoapp/providers/app_storage.dart';
import 'package:validators/validators.dart';
import 'dart:convert';
// import 'package:smartrepoapp/screens/singleurlscreen.dart';

class NewUrl extends StatefulWidget {
  final Function addUrl;

  NewUrl(this.addUrl);

  @override
  State<NewUrl> createState() => _NewUrlState();
}

class _NewUrlState extends State<NewUrl> {
  final _formkey = GlobalKey<FormState>();

  final _urlController = TextEditingController();

  // String _submitData() {
  //   if (_urlController.text.isEmpty) {
  //     return '';
  //   }

  //   final enteredUrl = _urlController.text;

  //   if (enteredUrl.isEmpty) {
  //     return 'Please enter the URL of repository';
  //   }

  //   if (!isURL(enteredUrl)) {
  //     return 'Please enter a valid URL';
  //   }

  //   widget.addUrl(
  //     enteredUrl,
  //   );

  //   Navigator.of(context).pop();
  //   return '';
  // }

  submitData() {
    Navigator.of(context).pop();
    if (_formkey.currentState!.validate()) {
      var siteStore = AppStorage();
      var fileContent = siteStore.readFile('sr_sites.txt');
      // var repoList = [];
      var sites = '';
      List<String> sitesList = [];
      fileContent.then((value) {
        sites = value;
        try {
          var sitesJson = json.decode(sites);
          sitesList = List.from(sitesJson);
          // print(sitesJson);
          // print(sitesList);
          // sitesList = List.from(sitesJson);
          // repoList = List.from(sitesJson);
        } catch (e, s) {
          print(e);
          // print(s);
          print('Something went wrong somewhere');
        }
        sitesList.add(_urlController.text);
        // print(sitesList);
        widget.addUrl(_urlController.text);
        var sitesUpdated = jsonEncode(sitesList);
        siteStore.writeFile('sr_sites.txt', sitesUpdated);
      });
    }
  }

  Form newForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            controller: _urlController,
            decoration: const InputDecoration(
              labelText: 'Smart Repository URL *',
              hintText: 'Base URL of your new Smart Repository site',
            ),
            validator: (value) {
              if (!isURL(value)) {
                return 'Please enter a valid URL';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              submitData();
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final repositoryData = Provider.of<Urls>(context);

    return SingleChildScrollView(
      // child: newForm(),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: newForm(),
        ),
      ),
    );
  }
}
