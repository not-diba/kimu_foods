import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kimu_foods/core/network/url.dart';
import 'package:kimu_foods/features/auth/data/schemas/verify_user_phone.dart';

import '../../../../core/network/entities/graphql_base_response.dart';
import '../../domain/entities/auth.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/auth_model.dart';
import '../schemas/authenticate_user.dart';

class AuthRepository implements AuthRepo {
  final EndPoint _endPoint = EndPoint();

  @override
  Future<GraphqlBaseResponse<Auth>> signInWithGoogle(String idToken) async {
    try {
      ValueNotifier<GraphQLClient> client = _endPoint.getClient();

      QueryResult result = await client.value.mutate(MutationOptions(
        document: gql(AuthenticateUserSchema.authenticateUserSchemaJSON),
        variables: {
          "idToken": idToken,
        },
      ));

      print('🔵 Mutation result: ${result.data}');

      if (result.hasException) {
        String errorMessage;
        if (result.exception!.graphqlErrors.isEmpty) {
          errorMessage = "No Internet connection.";
        } else {
          errorMessage = result.exception!.graphqlErrors[0].message.toString();
        }
        return GraphqlBaseResponse(message: errorMessage, successful: false);
      } else {
        Auth auth = AuthModel.fromJson(result.data!['authenticateUser']);
        print('🟢 User authenticated successfully: $auth');
        return GraphqlBaseResponse(data: auth, successful: true);
      }
    } catch (e) {
      print('Error occurred: $e');
      return GraphqlBaseResponse(
          message: 'An error occurred: $e', successful: false);
    }
  }

  @override
  Future<GraphqlBaseResponse<String>> verifyPhoneNumber(
      String userId, String phoneNumber) async {
    try {
      ValueNotifier<GraphQLClient> client = _endPoint.getClient();
      QueryResult result = await client.value.mutate(MutationOptions(
        document: gql(VerifyUserPhoneSchema.verifyPhoneNumberSchemaJSON),
        variables: {
          "userId": userId,
          "phoneNumber": phoneNumber,
        },
      ));

      print('🔵 Mutation result: ${result.data}');

      if (result.hasException) {
        String errorMessage;
        if (result.exception!.graphqlErrors.isEmpty) {
          errorMessage = "No Internet connection.";
        } else {
          errorMessage = result.exception!.graphqlErrors[0].message.toString();
        }
        return GraphqlBaseResponse(message: errorMessage, successful: false);
      } else {
        String message = result.data!['verifyUser'];
        return GraphqlBaseResponse(data: message, successful: true);
      }
    } catch (e) {
      print('Error occurred: $e');
      return GraphqlBaseResponse(
          message: 'An error occurred: $e', successful: false);
    }
  }
}
