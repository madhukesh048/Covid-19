// To parse this JSON data, do
//
//     final worldNews = worldNewsFromJson(jsonString);

import 'dart:convert';

WorldNews worldNewsFromJson(String str) => WorldNews.fromMap(json.decode(str));

String worldNewsToJson(WorldNews data) => json.encode(data.toMap());

class WorldNews {
    String status;
    int totalResults;
    List<Article> articles;

    WorldNews({
        this.status,
        this.totalResults,
        this.articles,
    });

    factory WorldNews.fromMap(Map<String, dynamic> json) => WorldNews(
        status: json["status"] == null ? null : json["status"],
        totalResults: json["totalResults"] == null ? null : json["totalResults"],
        articles: json["articles"] == null ? null : List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "totalResults": totalResults == null ? null : totalResults,
        "articles": articles == null ? null : List<dynamic>.from(articles.map((x) => x.toMap())),
    };
}

class Article {
    Source source;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

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

    factory Article.fromMap(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromMap(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        url: json["url"] == null ? null : json["url"],
        urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
    );

    Map<String, dynamic> toMap() => {
        "source": source == null ? null : source.toMap(),
        "author": author == null ? null : author,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "url": url == null ? null : url,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt": publishedAt == null ? null : publishedAt.toIso8601String(),
        "content": content == null ? null : content,
    };
}

class Source {
    String id;
    String name;

    Source({
        this.id,
        this.name,
    });

    factory Source.fromMap(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
    };
}
