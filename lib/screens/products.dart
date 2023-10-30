import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Products",
              textAlign: TextAlign.start,
              style: GoogleFonts.rubik(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.red,
                        ),
                        width: screenWidth / 4,
                        height: screenHeight / 8,
                      ),
                      SizedBox(width: 24),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.black,
                        ),
                        width: screenWidth / 3,
                        height: screenHeight / 6,
                      ),
                      SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                        width: screenWidth / 6,
                        height: screenHeight / 12,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.black,
                        ),
                        width: screenWidth / 3,
                        height: screenHeight / 6,
                      ),
                      SizedBox(width: 24),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.red,
                        ),
                        width: screenWidth / 4,
                        height: screenHeight / 8,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.red,
                        ),
                        width: screenWidth / 4,
                        height: screenHeight / 8,
                      ),
                      SizedBox(width: 24),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.black,
                        ),
                        width: screenWidth / 3,
                        height: screenHeight / 6,
                      ),
                      SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                        width: screenWidth / 6,
                        height: screenHeight / 12,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                        width: screenWidth / 6,
                        height: screenHeight / 12,
                      ),
                      SizedBox(width: 24),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.red,
                        ),
                        width: screenWidth / 4,
                        height: screenHeight / 8,
                      ),
                      SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.black,
                        ),
                        width: screenWidth / 3,
                        height: screenHeight / 6,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.black,
                        ),
                        width: screenWidth / 3,
                        height: screenHeight / 6,
                      ),
                      SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                        width: screenWidth / 6,
                        height: screenHeight / 12,
                      ),
                      SizedBox(width: 24),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.red,
                        ),
                        width: screenWidth / 4,
                        height: screenHeight / 8,
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
