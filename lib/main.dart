import 'package:accusia_assesment/model/dbmodel/categories.dart';
import 'package:accusia_assesment/model/dbmodel/child_cat.dart';
import 'package:accusia_assesment/model/dbmodel/ordercount.dart';
import 'package:accusia_assesment/model/dbmodel/products.dart';
import 'package:accusia_assesment/model/dbmodel/sharecount.dart';
import 'package:accusia_assesment/model/dbmodel/tax.dart';
import 'package:accusia_assesment/model/dbmodel/variants.dart';
import 'package:accusia_assesment/model/dbmodel/viewcount.dart';
import 'package:accusia_assesment/model/eproduct.dart';
import 'package:accusia_assesment/provider/db_provider.dart';
import 'package:accusia_assesment/screens/home/home_page.dart';
import 'package:flutter/material.dart';

import 'bloc/bloc_provider.dart';
import 'bloc/fetch_data.dart';

void main() async{
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
      debugShowCheckedModeBanner: false,
    );
  }
}


 Widget _getData() {
  return FutureBuilder(
      future:  DBProvider.db.getCatCount(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Text("Wait ..."));
        } else {
          if(snapshot != null){
            if(snapshot.data > 1){
              return HomePage();
            } else {
              return _blockData();
            }
          }
        }
      }
      );


}

Widget _blockData() {
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
    // ignore: missing_return
    builder: (context, snapshot){
      final results = snapshot.data;
      if (results == null) {
        return Center(
          child: Text("Wait ..."),
        );
      }

      EProduct eProduct = results.body;
      //Categories
      for (int i=0;i< eProduct.categories.length; i++){
        Categories categories = Categories(id: eProduct.categories[i].id, name: eProduct.categories[i].name);
        DBProvider.db.createEmployee(categories);
        // Products
        for(int j=0;j<eProduct.categories[i].products.length;j++){
          Products products = Products(id : eProduct.categories[i].products[j].id,
              name: eProduct.categories[i].products[j].name, cat_Id: eProduct.categories[i].id);
              DBProvider.db.createProduct(products);
              //variants
              for(int k=0;k < eProduct.categories[i].products[j].variants.length;k++){
                Variants variants = Variants(color: eProduct.categories[i].products[j].variants[k].color,
                    size: eProduct.categories[i].products[j].variants[k].size,
                price : eProduct.categories[i].products[j].variants[k].price,
                product_id: eProduct.categories[i].products[j].id);
                DBProvider.db.createVariants(variants);
              }

              //tax
              Tax tax = Tax(name: eProduct.categories[i].products[j].tax.name,
                  value: eProduct.categories[i].products[j].tax.value,
                  product_id: eProduct.categories[i].products[j].id);
              DBProvider.db.createTax(tax);
        }

        for(int m=0;m < eProduct.categories[i].child_categories.length; m++){
          ChildCat childCat = ChildCat(child_cat: eProduct.categories[i].child_categories[m],
              cat_id: eProduct.categories[i].id);
          DBProvider.db.createChildCat(childCat);
        }

      }

      //Rankings
      for(int n=0; n<eProduct.rankings.length; n++){

        for(int p=0; p < eProduct.rankings[n].products.length; p++){
          if(n == 0){
            ViewCount viewCount = ViewCount(id : eProduct.rankings[n].products[p].id , view_c: eProduct.rankings[n].products[p].viewCount);
            DBProvider.db.createViewCount(viewCount);
          } else if(n == 1){
            OrderCount orderCount = OrderCount(id : eProduct.rankings[n].products[p].id , order_c: eProduct.rankings[n].products[p].orderCount);
            DBProvider.db.createOrderCount(orderCount);
          } else if(n == 2){
            ShareCount shareCount = ShareCount(id : eProduct.rankings[n].products[p].id , share_c: eProduct.rankings[n].products[p].mostShares);
            DBProvider.db.createShareCount(shareCount);
          }
        }
      }

      return HomePage();
    },
  );
}
