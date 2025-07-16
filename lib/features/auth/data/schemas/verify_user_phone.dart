class VerifyUserPhoneSchema {
  static String verifyPhoneNumberSchemaJSON = r"""
      mutation VerifyUser($userId: String!, $phoneNumber: String!) {
        verifyUser(userId: $userId, phoneNumber: $phoneNumber)
      }
""";
}
