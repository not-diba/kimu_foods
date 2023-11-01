import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/utils/utils.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Profile",
            textAlign: TextAlign.start,
            style: GoogleFonts.rubik(
              fontSize: 26,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://instagram.fnuu2-1.fna.fbcdn.net/v/t51.2885-19/382625308_247856468251330_6112688731889636330_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fnuu2-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=g7O26hvVfhEAX_YnKu9&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfC6nzDJeX6c7XVV4D5AE7g_nWil8oTgOnyaskc7ndUIlw&oe=6548A4E2&_nc_sid=8b3546'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            decoration: BoxDecoration(
                                color: mainColor[500],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.photo_camera,
                                color: Colors.white,
                                size: 16,
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Elvis Madiba",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.rubik(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "elvis.madiba@gmail.com",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.location_on_outlined),
                      const SizedBox(width: 6),
                      Text(
                        "Nairobi, Kenya",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          color: mainColor[500],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                  const Divider(
                    height: 22,
                    color: Colors.grey,
                    thickness: .2,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Addresses",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                  const Divider(
                    height: 22,
                    color: Colors.grey,
                    thickness: .3,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Terms & Conditions",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                  const Divider(
                    height: 22,
                    color: Colors.grey,
                    thickness: .3,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Privacy Policy",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                  const Divider(
                    height: 22,
                    color: Colors.grey,
                    thickness: .3,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Logout",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(Icons.logout),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
