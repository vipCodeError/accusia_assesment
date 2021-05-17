import 'package:accusia_assesment/provider/db_provider.dart';
import 'package:flutter/material.dart';

class Ranking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Rank();
  }
}

class _Rank extends State<Ranking> {
  String dropdownValue = 'View';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });

            },
            items: <String>['View', 'Share', 'Order']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),


        _getDataByRanking()

        ],
      ),
    );
  }
}

Widget _getDataByRanking(){
  return FutureBuilder(
      future: DBProvider.db.getProductByRanking(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
           return Center(child: Text("Wait ..."));
        } else {
          return Expanded(
            child: ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(snapshot.data[index].name),
                          )),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.blue
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(snapshot.data[index].view_c.toString()),
                          ))
                    ],
                  ),
                ),
              );
            }),
          );
        }
    });
}
