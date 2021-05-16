import 'package:accusia_assesment/model/eproduct.dart';
import 'package:accusia_assesment/provider/db_provider.dart';
import 'package:accusia_assesment/screens/home/home_page.dart';
import 'package:flutter/material.dart';

import 'bloc/bloc_provider.dart';
import 'bloc/fetch_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'accusia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _getData(),
    );
  }
}


Widget _getData(){
  final bloc = FetchData();
  bloc.fetchEComData();
  return BlocProvider<FetchData>(
    bloc: bloc,
    child: Container(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildStreamBuilder(bloc),
      ),
    ),
  );
}

Widget _buildStreamBuilder(FetchData result) {
  return StreamBuilder(
    stream: result.actorStream,
    builder: (context, snapshot){
      final results = snapshot.data;
      if (results == null) {
        return Center(

        );
      }


   //   DBProvider.db.createEmployee(newEmployee)

      return HomePage();
    },
  );
}
