import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kimu_foods/core/network/entities/graphql_base_response.dart';
import 'package:kimu_foods/core/network/url.dart';
import 'package:kimu_foods/features/profile/data/models/profile_model.dart';
import 'package:kimu_foods/features/profile/data/schemas/profile.dart';
import 'package:kimu_foods/features/profile/domain/entities/profile.dart';
import 'package:kimu_foods/features/profile/domain/repos/profile_repo.dart';

class ProfileRepository implements ProfileRepo {
  final EndPoint _endPoint = EndPoint();

  @override
  Future<GraphqlBaseResponse<Profile>> getProfile() async {
    try {
      ValueNotifier<GraphQLClient> client = _endPoint.getClient();

      QueryResult result = await client.value.mutate(MutationOptions(
        document: gql(ProfileSchema.profileSchemaJSON),
      ));

      if (result.hasException) {
        String errorMessage;
        if (result.exception!.graphqlErrors.isEmpty) {
          errorMessage = "No Internet connection.";
        } else {
          errorMessage = result.exception!.graphqlErrors[0].message.toString();
        }
        return GraphqlBaseResponse(message: errorMessage, successful: false);
      } else {
        Profile profile = mapProfileResponseData(result.data!)!;
        return GraphqlBaseResponse(data: profile, successful: true);
      }
    } catch (e, stackTrace) {
      // TODO: log instead of print
      print('Stack trace $stackTrace');
      return GraphqlBaseResponse(
          message: 'An error occurred: $e', successful: false);
    }
  }

  Profile? mapProfileResponseData(Map<String, dynamic> profileGraphQLData) {
    if (profileGraphQLData.isNotEmpty &&
        profileGraphQLData['profile'] != null) {
      final profileData = profileGraphQLData['profile'];
      return ProfileModel.fromJson(profileData);
    } else {
      return null;
    }
  }
}
