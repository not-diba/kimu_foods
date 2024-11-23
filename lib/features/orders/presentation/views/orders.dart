import 'package:flutter/material.dart';
import 'package:kimu_foods/core/components/kimu_app_bar.dart';
import 'package:kimu_foods/core/utils/generics/sliver_header_delegate.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';
import 'package:ming_cute/ming_cute.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with TickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> _orderStateList = [
    'Upcoming',
    'History',
    'Refund',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _orderStateList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            kimuAppBar(
              context: context,
              collapsedTitle: 'Orders',
              mainTitleMedium: 'Your',
              mainTitleBold: 'Orders 🛒',
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                height: 40.0,
                child: _orderStateTabBar(),
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    _upcomingTab(),
                    const Center(
                      child: Text("History"),
                    ),
                    const Center(
                      child: Text("Refund"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TabBar _orderStateTabBar() {
    return TabBar(
      controller: _tabController,
      labelPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      indicatorPadding: EdgeInsets.zero,
      tabAlignment: TabAlignment.start,
      padding: EdgeInsets.zero,
      isScrollable: true,
      tabs: _orderStateList
          .map(
            (String tab) => Tab(
              text: tab,
            ),
          )
          .toList(),
    );
  }

  Padding _upcomingTab() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: blanchedAlmond,
              borderRadius: BorderRadius.circular(24.0),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .3,
                      child: Stack(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 4,
                                color: const Color(0xFFA26161),
                              ),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://www.foodandwine.com/thmb/DI29Houjc_ccAtFKly0BbVsusHc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/crispy-comte-cheesburgers-FT-RECIPE0921-6166c6552b7148e8a8561f7765ddf20b.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 35,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: const Color(0xFFA26161),
                                ),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://recipes.timesofindia.com/thumb/59736398.cms?width=1200&height=900',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * .5,
                          child: Text(
                            'Recipe 1, Recipe 2',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '#342347',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: kimuPrimary,
                                  ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DELIVERY TIME',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: '3:32 ',
                                    style: TextStyle(color: kimuPrimary)),
                                TextSpan(
                                    text: 'PM', style: TextStyle(color: taupe)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'STATUS',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            'On the way',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: kimuPrimary),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: paleTaupe),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Refund',
                                style: TextStyle(color: kimuTertiary),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text('Track order')),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          // TODO: This will probably be a list
          Text(
            'Previous Orders',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(width: 1.2, color: paleTaupe),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .3,
                      child: Stack(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 4,
                                color: const Color(0xFFA26161),
                              ),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://www.foodandwine.com/thmb/DI29Houjc_ccAtFKly0BbVsusHc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/crispy-comte-cheesburgers-FT-RECIPE0921-6166c6552b7148e8a8561f7765ddf20b.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 35,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: const Color(0xFFA26161),
                                ),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://recipes.timesofindia.com/thumb/59736398.cms?width=1200&height=900',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * .5,
                          child: Text(
                            'Fried, Mixed Potatoes',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodySmall,
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'KSh 400 ',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: '•',
                                style: TextStyle(color: Color(0xFFBCB3AB)),
                              ),
                              TextSpan(
                                text: ' 2 Recipes',
                                style: TextStyle(color: Color(0xFFBCB3AB)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          MingCute.checkbox_fill,
                          color: kimuPrimary,
                          size: 22.0,
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          'Delivered',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.apply(color: kimuPrimary),
                        ),
                      ],
                    ),
                    Text(
                      '#342346',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.apply(color: kimuPrimary),
                    ),
                    Text(
                      '26 Jun, 11:15',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.apply(color: kimuPrimary),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          onPressed: () {}, child: const Text('Rate Order')),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: TextButton(
                          onPressed: () {}, child: const Text('Re-order')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
