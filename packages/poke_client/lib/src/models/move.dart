
import 'package:json_annotation/json_annotation.dart';

/// Moves model
@JsonSerializable()
class Move {
    const Move({required this.name, required this.url});

    factory Move.fromJson(Map<String, dynamic> json) {
        return Move(
            name: json['name'] as String,
            url: json['url'] as String,
        );
    }
    final String name;
    final String url;
}