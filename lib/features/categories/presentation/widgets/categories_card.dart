// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class CategoriesCard extends StatelessWidget {
//   final String imageUrl;
//   final String categoryName;
//
//   const CategoriesCard(
//       {super.key, required this.imageUrl, required this.categoryName});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       child: Card(
//         elevation: 10,
//         shadowColor: Colors.transparent,
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18),
//         ),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(18),
//               ),
//               child: Image.network(
//                 imageUrl,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: double.infinity,
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(18),
//                 ),
//                 gradient: LinearGradient(
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                   stops: const [.3, 1],
//                   colors: [
//                     Colors.white.withOpacity(1),
//                     Colors.transparent,
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 40),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     categoryName,
//                     style: GoogleFonts.rubik(
//                         fontSize: 18, fontWeight: FontWeight.w400),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
