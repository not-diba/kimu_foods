import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 120.0,
            elevation: 0.0,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text.rich(
                      textAlign: TextAlign.start,
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Special',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w300),
                          ),
                          TextSpan(
                            text: ' menu offers for you',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Icon(Icons.local_offer, color: Colors.orange),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    height: 100,
                    color:
                        index.isEven ? Colors.amberAccent : Colors.blueAccent,
                    child: Center(
                      child: Text(
                        'List Item $index',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
