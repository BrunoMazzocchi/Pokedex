import 'package:json_annotation/json_annotation.dart';

import 'ability.dart';

/// Abilities model
@JsonSerializable()
class  Abilities {

  /// Abilities model
  const Abilities({required this.ability, required this.isHidden, required this.slot});

  /// Creates a [Abilities] from a JSON object
  factory Abilities.fromJson(Map<String, dynamic> json) {
    return Abilities(
      ability: Ability.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool,
      slot: json['slot'] as int,
    );
  }
  final Ability ability;
  final bool isHidden;
  final int slot;

}