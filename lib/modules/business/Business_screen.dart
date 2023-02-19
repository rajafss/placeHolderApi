

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:placeholderapi/model/articles/Article_model.dart';
import 'package:placeholderapi/screens/details/details_screen.dart';
import 'package:placeholderapi/shared/compenent/compenent.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  List<dynamic> business = [];


  // @override
  // void initState() {
  //   super.initState();
  //   this.getBusiness();
  // }
  // void getBusiness(){
  //   DioHelper.getData(
  //       url: 'v2/top-headlines',
  //       query: {
  //         'country':'us',
  //         'category':'business',
  //         'apiKey':'c97a90d2ea0343a69d89f321b38e253e',
  //       }).then((value) {
  //     // print(value.data.toString());
  //     business = value.data;
  //     print(value.data);
  //
  //   }).catchError((error){
  //     print(error.toString());
  //
  //   });
  //
  //
  //
  // }
  void initState() {
    super.initState();
    fetchdata();
  }
  fetchdata() async{
    var url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c97a90d2ea0343a69d89f321b38e253e";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      List<Articles> items = json.decode(response.body)["articles"];
      print(items[0].title);
      setState(() {
        business = items;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        // color scroll
          physics: BouncingScrollPhysics(),
        itemCount:  business.length,
          separatorBuilder: (context, index) => myDivider(),
          itemBuilder: (context,index) {

            return InkWell(
              onTap: () {
                print(business[index].title);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  DetailScreen(todo: business[index]),
                  ),
                );
              },
              child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage('${business[index].urlToImage}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 120.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              '${business[index].title}',
                              style: Theme.of(context).textTheme.bodyText1,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,

                            ),
                          ),
                          Text(
                            '${business[index].publishedAt}',
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),
            );

  }
    );

  }
}
