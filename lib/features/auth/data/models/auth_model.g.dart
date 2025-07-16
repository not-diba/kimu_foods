// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      userId: json['userId'] as String,
      message: json['message'] as String,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'message': instance.message,
      'accessToken': instance.accessToken,
    };
