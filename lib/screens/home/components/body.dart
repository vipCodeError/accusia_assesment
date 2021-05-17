import 'package:accusia_assesment/provider/db_provider.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  String id;


  Body({this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DBProvider.db.getProductByCatId(id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text("Wait ..."));
          } else {
            return Scaffold(
              body: Container(
                child: ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                          ),
                          child: Text(snapshot.data[index].name, style: TextStyle(
                            fontSize: 17,
                            color: Colors.black
                          ),),
                        ),


                        FutureBuilder(
                          future: DBProvider.db.getVaraintByProductId(snapshot.data[index].id.toString()),
                          builder: (BuildContext context, AsyncSnapshot snapshot_var) {
                            if (!snapshot_var.hasData) {
                            return Center(child: Text("Wait ..."));
                            } else {
                              return Container(
                                height: 150,
                                child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: snapshot_var.data.length,itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.greenAccent
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Color : " +snapshot_var.data[index].color),
                                          Text("size : " +snapshot_var.data[index].size),
                                          Text("price : " +snapshot_var.data[index].price.toString()),
                                          FutureBuilder(
                                              future: DBProvider.db.getTaxByProductId(snapshot.data[index].id.toString()),
                                              builder: (BuildContext context, AsyncSnapshot snapshot_tax) {
                                                if (!snapshot_tax.hasData) {
                                                  return Center(child: Text("Wait ..."));
                                                } else {
                                                  return Container(
                                                    margin: const EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        color: Colors.red.withOpacity(0.7)
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Tax : " +snapshot_tax.data[0].name, style: TextStyle(
                                                            color: Colors.white
                                                          ),),
                                                          Text("value : " +snapshot_tax.data[0].value.toString(), style: TextStyle(
                                                              color: Colors.white
                                                          ),),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }
                                              }
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              );
                            }
                          }
                        ),

                      ],),
                    ),
                  );
                }),
              ),
            );
          }
        });
  }

}