import '../../../../core/network/entities/graphql_base_response.dart';
import '../entities/auth.dart';

abstract class AuthRepo {
  Future<GraphqlBaseResponse<Auth>> signInWithGoogle(String idToken);
  Future<GraphqlBaseResponse<String>> verifyPhoneNumber(
    String userId,
    String phoneNumber,
  );
}
