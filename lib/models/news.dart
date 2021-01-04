import 'dart:convert';

class News {
    News({
        this.status,
        this.totalResults,
        this.articles,
    });

    String status;
    int totalResults;
    List<Article> articles;

    factory News.fromRawJson(String str) => News.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory News.fromJson(Map<String, dynamic> json) => News(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    Source source;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

    factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}

class Source {
    Source({
        this.id,
        this.name,
    });

    Id id;
    Name name;

    factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"]],
        name: nameValues.map[json["name"]],
    );

    Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": nameValues.reverse[name],
    };
}

enum Id { GOOGLE_NEWS }

final idValues = EnumValues({
    "google-news": Id.GOOGLE_NEWS
});

enum Name { GOOGLE_NEWS }

final nameValues = EnumValues({
    "Google News": Name.GOOGLE_NEWS
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}