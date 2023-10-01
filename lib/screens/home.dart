import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today'\s Picks",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.rubik(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Icon(
                  Icons.search_sharp,
                  size: 32,
                  color: Colors.black,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return FeedCard();
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
