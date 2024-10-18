import 'package:kimu_foods/core/network/entities/graphql_base_response.dart';
import 'package:kimu_foods/features/profile/domain/entities/profile.dart';

abstract class ProfileRepo {
  Future<GraphqlBaseResponse<Profile>> getProfile();
}
