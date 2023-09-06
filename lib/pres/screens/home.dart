import 'package:dio/dio.dart';
import 'package:ecommerce/Data/prodJson.dart';
import 'package:ecommerce/pres/screens/product.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Data>>(
            future: ProductsDio(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount:snapshot.data!.length ,
                    itemBuilder: (context,index){
                      Data item=snapshot.data![index];
                      return ListTile(
                          title: Text(item.title.toString()),
                          subtitle: Text("price ${item.price.toString()}"),
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsDetails(id:item.slug.toString() ,)));
                        },
                      );
                    });
              }  else if (snapshot.hasError) {
                return Text("error");
              } else {
                return Text("data");
              }
            }),
      ),
    );
  }

  Future<List<Data>> ProductsDio() async {
    Response response =
        await Dio().get("https://api.storerestapi.com/products");
    print(response.statusCode);
    var products = ProdJson.fromJson(response.data);
    print(products.status);
    return products.data as List<Data>;
  }
}

