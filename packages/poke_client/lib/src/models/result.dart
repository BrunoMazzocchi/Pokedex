
import 'package:json_annotation/json_annotation.dart';


/// Results model
@JsonSerializable()
class Results {
  final String name;
  final String url;

  Results({required this.name, required this.url});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }


}