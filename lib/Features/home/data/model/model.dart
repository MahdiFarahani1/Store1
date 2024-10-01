class CategoryModel {
  final int id;
  final int parentId;
  final String title;

  CategoryModel({
    required this.id,
    required this.parentId,
    required this.title,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      parentId: json['parent_id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parent_id': parentId,
      'title': title,
    };
  }
}
