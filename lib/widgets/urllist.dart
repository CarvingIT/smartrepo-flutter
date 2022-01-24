// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

import '../providers/url.dart';
import '../screens/mainscreen.dart';

class UrlList extends StatelessWidget {
  final List<Url> urls;
  // final List<dynamic> urls;
  final Function deleteUrl;

  UrlList(this.urls, this.deleteUrl);

  @override
  Widget build(BuildContext context) {
    return urls.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    'No repositories added yet!!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                elevation: 1,
                child: ListTile(
                  // leading: const CircleAvatar(
                  //   radius: 20,
                  //   child: Padding(
                  //     padding: EdgeInsets.all(6),
                  //     child: FittedBox(
                  //       child: Text('test'),
                  //     ),
                  //   ),
                  // ),
                  title: Text(
                    urls[index].url,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    urls[index].url,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      deleteUrl(urls[index].id);
                    },
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                  ),
                ),
              );
            },
            itemCount: urls.length,
          );
  }
}
