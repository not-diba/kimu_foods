class ProfileSchema {
  static String profileSchemaJSON = """
  query {
    profile {
      country
      county
      createdAt
      email
      firstName
      id
      lastName
      phoneNumber
      updatedAt
      profileImg
    }
  }
  """;
}
