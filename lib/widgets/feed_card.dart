import 'package:flutter/material.dart';
import 'package:kimu_foods/utils/utils.dart';

class FeedCard extends StatefulWidget {
  const FeedCard({super.key});

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Card(
        elevation: 100,
        shadowColor: Colors.transparent,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 380,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.network(
                      'https://picsum.photos/400/300',
                      fit: BoxFit.cover,
                      height: 300,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const Text(
                        "Welcome to AllAboutFlutter",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        "Welcome to AllAboutFlutter",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        "Welcome to AllAboutFlutter",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        "Welcome to AllAboutFlutter",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 0, // Adjust the top position as needed
              left: 0, // Adjust the left position as needed
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: backgroundColor[600], // Customize the badge color
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight:
                          Radius.circular(20)), // Match card's border radius
                ),
                child: Text(
                  "BADGE TEXT",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white, // Customize text color
                    fontSize: 16, // Customize text size
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
