// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../../core/utils/theme/material_colors.dart';
//
// class Products extends StatefulWidget {
//   const Products({super.key});
//
//   @override
//   State<Products> createState() => _ProductsState();
// }
//
// class _ProductsState extends State<Products> {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Products",
//               textAlign: TextAlign.start,
//               style: GoogleFonts.rubik(
//                 fontSize: 26,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 16),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: backgroundColor[600],
//                         ),
//                         width: screenWidth / 6,
//                         height: screenHeight / 12,
//                       ),
//                       const SizedBox(width: 24),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: secondaryColorTeal[700],
//                         ),
//                         width: screenWidth / 3,
//                         height: screenHeight / 6,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Text(
//                               "Groceries",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.rubik(
//                                 fontSize: 24,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: darkGrey[200],
//                         ),
//                         width: screenWidth / 4,
//                         height: screenHeight / 8,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Text(
//                               "Teas",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.rubik(
//                                 fontSize: 22,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: darkGrey[300],
//                         ),
//                         width: screenWidth / 3,
//                         height: screenHeight / 6,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Text(
//                               "Restock",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.rubik(
//                                 fontSize: 22,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 24),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: teal[400],
//                         ),
//                         width: screenWidth / 3.5,
//                         height: screenHeight / 7,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Text(
//                               "Vegetables",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.rubik(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: darkGrey[200],
//                         ),
//                         width: screenWidth / 3.5,
//                         height: screenHeight / 7,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Text(
//                               "Legumes",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.rubik(
//                                 fontSize: 20,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 24),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: purple[400],
//                         ),
//                         width: screenWidth / 3,
//                         height: screenHeight / 6,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Text(
//                               "Spices",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.rubik(
//                                 fontSize: 24,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: backgroundColor[600],
//                         ),
//                         width: screenWidth / 6,
//                         height: screenHeight / 12,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: backgroundColor[600],
//                         ),
//                         width: screenWidth / 6,
//                         height: screenHeight / 12,
//                       ),
//                       const SizedBox(width: 24),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: mainColor[500],
//                         ),
//                         width: screenWidth / 4,
//                         height: screenHeight / 8,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Text(
//                               "Cooking Oil",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.rubik(
//                                 fontSize: 20,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: darkGrey[200],
//                         ),
//                         width: screenWidth / 3,
//                         height: screenHeight / 6,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Text(
//                               "Water Delivery",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.rubik(
//                                 fontSize: 24,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: darkGrey[300],
//                         ),
//                         width: screenWidth / 3,
//                         height: screenHeight / 6,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Text(
//                               "Groceries",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.rubik(
//                                 fontSize: 24,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: backgroundColor[600],
//                         ),
//                         width: screenWidth / 6,
//                         height: screenHeight / 12,
//                       ),
//                       const SizedBox(width: 24),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           color: secondaryColorTeal[700],
//                         ),
//                         width: screenWidth / 4,
//                         height: screenHeight / 8,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Text(
//                               "Legumes",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.rubik(
//                                 fontSize: 18,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 100),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
