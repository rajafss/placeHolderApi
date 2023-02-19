import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class TitleApi extends StatefulWidget {


  @override
  State<TitleApi> createState() => _TitleApiState();
}

class _TitleApiState extends State<TitleApi> {

  List<dynamic> posts = [];
  @override
  void initState() {
    super.initState();
    this.fetchdata();
  }
  fetchdata() async{
    var url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c97a90d2ea0343a69d89f321b38e253e";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      List<dynamic> items = json.decode(response.body)["articles"];
      print(items[0]["title"]);
      setState(() {
        posts = items;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
                'Place Holder api',
            )
        ),
      ),
      body:  ListView.separated(
              separatorBuilder: (context, index) =>
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)),),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                print(posts[index]['title']);
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(child: Image.network('${posts[index]['urlToImage']}',)),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('${posts[index]['title']}', style: TextStyle(fontWeight: FontWeight
                                  .bold, fontSize: 16.0),maxLines: 2,overflow: TextOverflow.ellipsis),
                              Text('${posts[index]['description']}', style: TextStyle(fontSize: 14.0),maxLines: 3,overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }


      ),
    );
  }
}
