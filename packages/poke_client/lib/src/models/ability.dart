
import 'package:json_annotation/json_annotation.dart';

/// Ability model
@JsonSerializable()
class Ability {

  const Ability({required this.name, required this.url});

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
  final String name;
  final String url;
}