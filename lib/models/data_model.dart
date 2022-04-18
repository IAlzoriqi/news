class DataModel {
  final String? author;
  final String? title;
  final String? description;
  final String? source;
  final String? category;
  final String? country;
  final String? published_at;
  final String? image;
  final String? url;
  DataModel({
     this.author,
     this.title,
     this.description,
     this.source,
     this.category,
     this.country,
     this.published_at,
     this.image,
     this.url,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      author: json["author"]?? 'Some author' ,
      title: json['title'] ?? 'Some title',
      description: json['description'] ?? 'Some description',
      source: json['source'] ?? 'some source',
      category: json['category'] ?? 'some category',
      country: json['country'] ?? 'some country',
      published_at: json['published_at'] ?? 'some published at',
      image: json['image']?? "hhh",
      url: json['url']?? 'some url',
    );
  }
}
