import 'dart:convert';

import 'package:api_exp_341/product_model.dart';
import 'package:api_exp_341/quote_model.dart';
import 'package:api_exp_341/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as apiClient;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<DataModel?> getQuotes() async{
    /// api client call
    String url = "https://dummyjson.com/quotes";

    apiClient.Response res = await apiClient.get(Uri.parse(url));

    if(res.statusCode==200){
       ///all okay
      print(res.body);
      DataModel mData = DataModel.fromJson(jsonDecode(res.body));
      return mData;

    } else {
      print("Error: ${res.statusCode}");
      return null;
    }



  }
  Future<DataTodoModel?> getTodos() async{
    /// api client call
    String url = "https://dummyjson.com/todos";
    apiClient.Response res = await apiClient.get(Uri.parse(url));

    if(res.statusCode==200){
      ///all okay
      print(res.body);
      DataTodoModel mData = DataTodoModel.fromJson(jsonDecode(res.body));
      return mData;

    } else {
      print("Error: ${res.statusCode}");
      return null;
    }

  }
  Future<DataProductModel?> getProducts() async{
    /// api client call
    String url = "https://dummyjson.com/products";
    apiClient.Response res = await apiClient.get(Uri.parse(url));

    if(res.statusCode==200){
      ///all okay
      print(res.body);
      DataProductModel mData = DataProductModel.fromJson(jsonDecode(res.body));
      return mData;

    } else {
      print("Error: ${res.statusCode}");
      return null;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
      ),
      body: FutureBuilder(
          future: getProducts(),
          builder: (_, snap){
            if(snap.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }

            if(snap.hasError){
              return Center(child: Text("${snap.error}"),);
            }

            if(snap.hasData){
              return snap.data!=null ? snap.data!.products!.isNotEmpty ? ListView.builder(
                  itemCount: snap.data!.products!.length,
                  itemBuilder: (_, index){
                    return Column(
                      children: [
                        ListTile(
                          leading: snap.data!.products![index].thumbnail != null ? Image.network(snap.data!.products![index].thumbnail!) : Container(),
                          title: Text(snap.data!.products![index].title ?? "No Title"),
                          subtitle: Text(snap.data!.products![index].description ?? "No Description"),
                          trailing: Text(snap.data!.products![index].meta!.createdAt!.split("T")[0]),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snap.data!.products![index].images!.length,
                              itemBuilder: (_, childIndex){
                              return Image.network(snap.data!.products![index].images![childIndex]);
                          }),
                        )
                      ],
                    );
                  }) : Center(child: Text('No Quotes found!!'),) : Container();
            }

            return Container();

          })
    );
  }
}
