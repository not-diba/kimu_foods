import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/auth.dart';
part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel extends Auth {
  AuthModel({
    required super.userId,
    required super.message,
    required super.accessToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
