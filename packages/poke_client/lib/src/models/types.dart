
import 'package:json_annotation/json_annotation.dart';
import 'type.dart';
@JsonSerializable()
class Types {
  final int slot;
  final Type type;

  const Types({required this.slot, required this.type});

  factory Types.fromJson(Map<String, dynamic> json) {
    return Types(
      slot: json['slot'] as int,
      type: Type.fromJson(json['type'] as Map<String, dynamic>),
    );
  }
}