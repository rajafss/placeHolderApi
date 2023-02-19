
import 'package:flutter/material.dart';

Widget myDivider() =>  Container(
  height: 2,
  margin: EdgeInsets.only(
      top: 5, right:10),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5.0),
    color: Colors.white12,
  ),
);

Widget buildArticles(article, context) =>
    Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage('${article[context]['urlToImage']}'),
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
                  '${article[context]['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,

                ),
              ),
              Text(
                '${article[context]['publishedAt']}',
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
);