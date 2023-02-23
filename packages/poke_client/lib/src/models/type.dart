
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Type {
  final String name;
  final String url;

  const Type({required this.name, required this.url});

  factory Type.fromJson (Map<String, dynamic> json) {
    return Type(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

}