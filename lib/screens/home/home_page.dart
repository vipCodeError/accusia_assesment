

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      drawer: Drawer(
        child: ListView.builder(itemBuilder: (context, index) {
          return ListTile(

          );
        }),
      ),
      body: Body(),
    );
  }

}