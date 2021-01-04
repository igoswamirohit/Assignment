import 'package:assignment/providers/news_provider.dart';
import 'package:assignment/widgets/article_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Text(
            'Coninstelly',
            style: Theme.of(context).textTheme.headline6,
          ),
          centerTitle: true,
          elevation: 6,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                ))
          ],
        ),
        backgroundColor: Colors.lightBlue[50],
        body: FutureBuilder(
          future: Provider.of<NewsProvider>(context, listen: false).getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) =>
                      ArticleCard(snapshot.data[index]));
            return CircularProgressIndicator();
          },
        ));
  }
}
