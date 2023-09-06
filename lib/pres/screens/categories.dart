import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../Data/CategoriesJeson.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Data>>(
            future: categoriesDio(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Card(
                  child: ListView.builder(
                      itemCount:snapshot.data!.length ,
                      itemBuilder: (context,index){
                        Data item=snapshot.data![index];
                        return  ListTile(
                            title: Text(item.name.toString()),
                            subtitle: Text(item.slug.toString()),
                            selectedTileColor: Colors.orange[100],
                        );
                      }),
                );
              }  else if (snapshot.hasError) {
                return Text("error");
              } else {
                return Text("data");
              }
            }),
      ),
    );
  }
  Future<List<Data>> categoriesDio() async {
    Response response =
    await Dio().get("https://api.storerestapi.com/categories");
    print(response.statusCode);
    var categories = CategoriesJeson.fromJson(response.data);
    print(categories.status);
    return categories.data as List<Data>;
  }
}
