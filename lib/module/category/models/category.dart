class Category {
  int? id;
  String? category;
  String? url;

  Category({this.id, this.category, this.url});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['url'] = url;
    return data;
  }
}
