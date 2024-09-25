class Profile {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String county;
  final String country;
  final String? profileImg;
  final String createdAt;

  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.county,
    required this.country,
    required this.createdAt,
    this.profileImg
  });
}
