// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:kimu_foods/core/network/entities/graphql_base_response.dart';
// import 'package:kimu_foods/features/profile/domain/entities/profile.dart';
// import 'package:kimu_foods/features/profile/domain/providers/profile_provider.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../core/utils/theme/material_colors.dart';
//
// class ProfileView extends StatefulWidget {
//   const ProfileView({super.key});
//
//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }
//
// class _ProfileViewState extends State<ProfileView> {
//   Future<GraphqlBaseResponse<Profile>>? _futureProfile;
//
//   @override
//   void initState() {
//     super.initState();
//     _getProfile();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 20,
//         right: 20,
//         top: 20,
//       ),
//       child: FutureBuilder(
//         future: _futureProfile,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             if (snapshot.data!.successful) {
//               return SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Profile",
//                       textAlign: TextAlign.start,
//                       style: GoogleFonts.rubik(
//                         fontSize: 26,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(Radius.circular(18)),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Stack(
//                                   children: [
//                                     const SizedBox(height: 10),
//                                     Container(
//                                       width: 100,
//                                       height: 100,
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                               '${snapshot.data!.data!.profileImg}'),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       bottom: 0,
//                                       right: 0,
//                                       child: Container(
//                                           decoration: BoxDecoration(
//                                               color: mainColor[500],
//                                               shape: BoxShape.circle,
//                                               border: Border.all(
//                                                   width: 2,
//                                                   color: Colors.white)),
//                                           child: const Padding(
//                                             padding: EdgeInsets.all(4),
//                                             child: Icon(
//                                               Icons.photo_camera,
//                                               color: Colors.white,
//                                               size: 16,
//                                             ),
//                                           )),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Text(
//                                   "${snapshot.data!.data!.lastName} ${snapshot.data!.data!.firstName}",
//                                   textAlign: TextAlign.start,
//                                   style: GoogleFonts.rubik(
//                                     fontSize: 22,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                                 Text(
//                                   snapshot.data!.data!.email,
//                                   textAlign: TextAlign.start,
//                                   style: GoogleFonts.rubik(
//                                     fontSize: 16,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 12),
//                                 Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     const Icon(Icons.location_on_outlined),
//                                     const SizedBox(width: 6),
//                                     Text(
//                                       "${snapshot.data!.data!.county}, ${snapshot.data!.data!.country}",
//                                       textAlign: TextAlign.start,
//                                       style: GoogleFonts.rubik(
//                                         fontSize: 16,
//                                         color: mainColor[500],
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Container(
//                           width: double.infinity,
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(Radius.circular(18)),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Payment",
//                                       textAlign: TextAlign.start,
//                                       style: GoogleFonts.rubik(
//                                         fontSize: 16,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     const Icon(Icons.arrow_forward),
//                                   ],
//                                 ),
//                                 const Divider(
//                                   height: 22,
//                                   color: Colors.grey,
//                                   thickness: .2,
//                                 ),
//                                 Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Delivery Addresses",
//                                       textAlign: TextAlign.start,
//                                       style: GoogleFonts.rubik(
//                                         fontSize: 16,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     const Icon(Icons.arrow_forward),
//                                   ],
//                                 ),
//                                 const Divider(
//                                   height: 22,
//                                   color: Colors.grey,
//                                   thickness: .3,
//                                 ),
//                                 Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Terms & Conditions",
//                                       textAlign: TextAlign.start,
//                                       style: GoogleFonts.rubik(
//                                         fontSize: 16,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     const Icon(Icons.arrow_forward),
//                                   ],
//                                 ),
//                                 const Divider(
//                                   height: 22,
//                                   color: Colors.grey,
//                                   thickness: .3,
//                                 ),
//                                 Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Privacy Policy",
//                                       textAlign: TextAlign.start,
//                                       style: GoogleFonts.rubik(
//                                         fontSize: 16,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     const Icon(Icons.arrow_forward),
//                                   ],
//                                 ),
//                                 const Divider(
//                                   height: 22,
//                                   color: Colors.grey,
//                                   thickness: .3,
//                                 ),
//                                 Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Logout",
//                                       textAlign: TextAlign.start,
//                                       style: GoogleFonts.rubik(
//                                         fontSize: 16,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     const Icon(Icons.logout),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 100,
//                     )
//                   ],
//                 ),
//               );
//             }
//           }
//           return const Center(
//             child: SizedBox(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> _getProfile() async {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       setState(() {
//         _futureProfile =
//             Provider.of<ProfileProvider>(context, listen: false).getProfile();
//       });
//     });
//   }
// }
