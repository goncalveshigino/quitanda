

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String title;
  String id;

  CategoryModel({
    required this.title,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);



  @override
  String toString() => 'CategoryModel(title: $title, id: $id)';
}
