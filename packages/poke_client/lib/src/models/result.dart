
import 'package:json_annotation/json_annotation.dart';


/// Results model
@JsonSerializable()
class Result {
  final String name;
  final String url;

  Result({required this.name, required this.url});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }


}