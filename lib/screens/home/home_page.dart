import 'package:accusia_assesment/model/dbmodel/categories.dart';
import 'package:accusia_assesment/provider/db_provider.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DBProvider.db.getAllCategories(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text("Wait ..."));
          } else {
            return Scaffold(
              appBar: AppBar(),
              drawer: Drawer(
                child: ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context, index) {
                  return ListTile(title: Text(snapshot.data[index].name), onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Body(id :snapshot.data[index].id.toString())),
                    );
                   // Navigator.pop(context);
                  },);
                }),
              ),
              body: Body(),
            );
          }
        });
  }
}
