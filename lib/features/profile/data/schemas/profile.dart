class ProfileSchema {
  static String profileSchemaJSON = """
  query Profile {
  profile {
    id
    firstName
    lastName
    email
    profileImg
    phoneNumber
    county
    country
    createdAt
  }
}
  """;
}
