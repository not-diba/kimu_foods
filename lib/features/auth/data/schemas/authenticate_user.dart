class AuthenticateUserSchema {
  static String authenticateUserSchemaJSON = r"""
        mutation AuthenticateUser($idToken: String!) {
          authenticateUser(idToken: $idToken) {
            userId
            message
            accessToken
          }
        }
""";
}
