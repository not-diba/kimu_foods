import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kimu_foods/core/components/kimu_app_bar.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';
import 'package:ming_cute/ming_cute.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget Function(bool isPinned) builder;

  _SliverAppBarDelegate({
    required this.builder,
  });

  @override
  double get minExtent => 30.0;

  @override
  double get maxExtent => 30.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    bool isPinned = shrinkOffset > 0;

    return SizedBox.expand(child: builder(isPinned));
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            kimuAppBar(
              context: context,
              collapsedTitle: 'Favourites',
              mainTitleMedium: 'Your',
              mainTitleBold: 'Favourites ♥️',
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _discountSection(),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                builder: (bool isPinned) {
                  return Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'All your dishes',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight:
                                isPinned ? FontWeight.w300 : FontWeight.w600,
                          ),
                    ),
                  );
                },
              ),
            ),
            _favouritesList(),
          ],
        ),
      ),
    );
  }

  Container _discountSection() {
    // TODO: use carasel here. where it goes through different discounts.
    return Container(
      height: 155,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          colors: [
            taupe,
            apricot,
          ],
          center: Alignment.bottomLeft,
          radius: 1.6,
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SvgPicture.asset(
              height: 400,
              width: 400,
              'lib/core/assets/svgs/ingredients_plate.svg',
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Discounts upto',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Text(
                      '40%',
                      style: TextStyle(
                          color: kimuSecondary,
                          fontSize: 48,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  SliverList _favouritesList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: _favouriteItem(
            index: index,
          ),
        ),
        childCount: 20,
      ),
    );
  }

  Dismissible _favouriteItem({required int index}) {
    return Dismissible(
      key: Key(index.toString()),
      onDismissed: (direction) {},
      direction: DismissDirection.endToStart,
      background: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: bone, width: 1.2),
          ),
          child: const Icon(
            MingCute.delete_3_line,
            size: 18.0,
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        return true;
      },
      child: Container(
        height: 155,
        width: double.infinity,
        decoration: BoxDecoration(
          color: blanchedAlmond,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        index.isEven
                            ? 'https://www.foodandwine.com/thmb/DI29Houjc_ccAtFKly0BbVsusHc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/crispy-comte-cheesburgers-FT-RECIPE0921-6166c6552b7148e8a8561f7765ddf20b.jpg'
                            : 'https://recipes.timesofindia.com/thumb/59736398.cms?width=1200&height=900',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 110,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Recipe name',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'KSh 2000',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: taupe,
                                  ),
                        ),
                        const SizedBox(height: 6.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              MingCute.time_line,
                              size: 14.0,
                              color: eerieBlack,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '20 mins',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: kimuPrimary,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: const Icon(
                      MingCute.add_fill,
                      color: Colors.white,
                      size: 20.0,
                    ),
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
