class NewsApi {
  String? version;
  String? userComment;
  String? nextUrl;
  String? homePageUrl;
  String? feedUrl;
  String? language;
  String? title;
  String? description;
  List<Items>? items;

  NewsApi(
      {this.version,
      this.userComment,
      this.nextUrl,
      this.homePageUrl,
      this.feedUrl,
      this.language,
      this.title,
      this.description,
      this.items});

  NewsApi.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    userComment = json['user_comment'];
    nextUrl = json['next_url'];
    homePageUrl = json['home_page_url'];
    feedUrl = json['feed_url'];
    language = json['language'];
    title = json['title'];
    description = json['description'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['user_comment'] = this.userComment;
    data['next_url'] = this.nextUrl;
    data['home_page_url'] = this.homePageUrl;
    data['feed_url'] = this.feedUrl;
    data['language'] = this.language;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? url;
  String? title;
  String? contentHtml;
  String? contentText;
  String? datePublished;
  String? dateModified;
  List<Authors>? authors;
  Authors? author;
  String? image;
  List<String>? tags;

  Items(
      {this.id,
      this.url,
      this.title,
      this.contentHtml,
      this.contentText,
      this.datePublished,
      this.dateModified,
      this.authors,
      this.author,
      this.image,
      this.tags});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    title = json['title'];
    contentHtml = json['content_html'];
    contentText = json['content_text'];
    datePublished = json['date_published'];
    dateModified = json['date_modified'];
    if (json['authors'] != null) {
      authors = <Authors>[];
      json['authors'].forEach((v) {
        authors!.add(new Authors.fromJson(v));
      });
    }
    author =
        json['author'] != null ? new Authors.fromJson(json['author']) : null;
    image = json['image'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['title'] = this.title;
    data['content_html'] = this.contentHtml;
    data['content_text'] = this.contentText;
    data['date_published'] = this.datePublished;
    data['date_modified'] = this.dateModified;
    if (this.authors != null) {
      data['authors'] = this.authors!.map((v) => v.toJson()).toList();
    }
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['image'] = this.image;
    data['tags'] = this.tags;
    return data;
  }
}

class Authors {
  String? name;
  String? url;
  String? avatar;

  Authors({this.name, this.url, this.avatar});

  Authors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['avatar'] = this.avatar;
    return data;
  }
}
