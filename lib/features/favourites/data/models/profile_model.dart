import 'package:json_annotation/json_annotation.dart';
import 'package:kimu_foods/features/profile/domain/entities/profile.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends Profile {
  ProfileModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.email,
    required super.county,
    required super.country,
    required super.createdAt,
    super.profileImg,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
