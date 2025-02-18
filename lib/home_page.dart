import 'dart:convert';

import 'package:api_exp_341/quote_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
      ),
      body: FutureBuilder(
          future: getQuotes(),
          builder: (_, snap){
            if(snap.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }

            if(snap.hasError){
              return Center(child: Text("${snap.error}"),);
            }

            if(snap.hasData){
              return snap.data!=null ? snap.data!.quotes!.isNotEmpty ? ListView.builder(
                  itemCount: snap.data!.quotes!.length,
                  itemBuilder: (_, index){
                    return ListTile(
                      title: Text(snap.data!.quotes![index].quote ?? "No Quote"),
                      subtitle: Text(snap.data!.quotes![index].author ?? "No Author"),
                    );
                  }) : Center(child: Text('No Quotes found!!'),) : Container();
            }

            return Container();

          })
    );
  }
}
