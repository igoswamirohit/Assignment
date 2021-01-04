import 'package:assignment/models/news.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, Article>;
    var article = args['article'];
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Coninstelly',
          style: textTheme.headline6,
        ),
        centerTitle: true,
        elevation: 6,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 6),
              child: Icon(
                Icons.share,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    article.title,
                    style: textTheme.headline4.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    article.content,
                    style: textTheme.caption.copyWith(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Image.network(article.urlToImage),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    article.description,
                    style: textTheme.caption.copyWith(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.author,
                            style: TextStyle(
                                color: Colors.pinkAccent, fontSize: 16),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(formatDate(
                              DateTime.now(), [dd, ' ', M, ' ', yyyy]))
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.message),
                      SizedBox(
                        width: 3,
                      ),
                      Text('25'),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.visibility,
                        color: Colors.pinkAccent,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('57', style: TextStyle(color: Colors.pinkAccent)),
                      SizedBox(
                        width: 3,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
