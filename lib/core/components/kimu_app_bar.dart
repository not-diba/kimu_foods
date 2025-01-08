import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:kimu_foods/core/utils/theme/colours.dart';
import 'package:ming_cute/ming_cute.dart';

SliverAppBar kimuAppBar({
  required BuildContext context,
  required String collapsedTitle,
  required String mainTitleMedium,
  required String mainTitleBold,
}) {
  return SliverAppBar(
    pinned: true,
    floating: false,
    expandedHeight: 90.0,
    elevation: 0.0,
    surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
    flexibleSpace: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool isCollapsed = constraints.biggest.height <= kToolbarHeight;
        return FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: Row(
            mainAxisAlignment: isCollapsed
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isCollapsed)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    collapsedTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => context.pushNamed('profile-view'),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: apricot,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          MingCute.user_1_line,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          background: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text.rich(
                textAlign: TextAlign.start,
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '$mainTitleMedium\n',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: mainTitleBold,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
