import 'package:assignment/models/news.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

// ignore: must_be_immutable
class ArticleCard extends StatelessWidget {
  Article article;

  ArticleCard(this.article, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 5),
      width: double.infinity,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, 'detailPage', arguments: {
          'article':article
        }),
              child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: IntrinsicHeight(
                            child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            article.author,
                            style:
                                TextStyle(color: Colors.pinkAccent, fontSize: 16),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(formatDate(DateTime.now(), [dd, ' ', M, ' ', yyyy]))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Image.network(article.urlToImage, height: 100, width: 100, fit: BoxFit.cover,)
                    )
                  ],
                ),
              )),
      ),
    );
  }
}
