class Category {
  final int id;
  final String name;
  final String imgUrlPath;

  Category({required this.id, required this.name, required this.imgUrlPath});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      // id: json['Id'] ,
     id: json['Id'] is int ? json['Id'] : int.parse(json['Id'].toString()),
      name: json['Name'] as String,
      imgUrlPath: json['ImgUrlPath'] as String,
    );
  }
}

class SubCategory {
  final int id;
  final String name;
  final String imgUrlPath;

  SubCategory({required this.id, required this.name, required this.imgUrlPath});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['Id'] is int ? json['Id'] : int.parse(json['Id'].toString()),
      name: json['Name'] as String,
      imgUrlPath: json['ImgUrlPath'] as String,
    );
  }
}
