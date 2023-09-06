import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../Data/ProductsDetailsJson.dart';

class ProductsDetails extends StatefulWidget {
  String id;

  ProductsDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deatails'),
      ),
      body: Center(
        child: FutureBuilder<ProductsDetailsJson>(
            future: DetailsDio(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,),
                  child: Center(
                    child: Container(
                      height: 500,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1.0,
                              offset: Offset(10, 10),
                              color: Colors.blueGrey,
                              blurStyle: BlurStyle.solid,
                            )
                          ]),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(snapshot.data!.data!.title!.toString()),
                            Text(snapshot.data!.data!.price.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("error");
              } else {
                return Text("data");
              }
            }),
      ),
    );
  }

  Future<ProductsDetailsJson> DetailsDio(String id) async {
    Response response =
        await Dio().get("https://api.storerestapi.com/products/$id");
    print(response.statusCode);
    ProductsDetailsJson model = ProductsDetailsJson.fromJson(response.data);
    print(model.status);
    return model;
  }
}
