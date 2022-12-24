class EBook {
  String? url;
  String? title;
  String? content;
  String? author;
  String? category;
  String? populer;
  int? latest;
  int? like;
  int? view;
  int? year;
  int? pages;

  EBook(
      {this.url,
      this.title,
      this.content,
      this.author,
      this.category,
      this.populer,
      this.latest,
      this.like,
      this.view,
      this.year,
      this.pages});

  EBook.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    content = json['content'];
    author = json['author'];
    category = json['category'];
    populer = json['populer'];
    latest = json['latest'];
    like = json['like'];
    view = json['view'];
    year = json['year'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['title'] = title;
    data['content'] = content;
    data['author'] = author;
    data['category'] = category;
    data['populer'] = populer;
    data['latest'] = latest;
    data['like'] = like;
    data['view'] = view;
    data['year'] = year;
    data['pages'] = pages;
    return data;
  }
}
