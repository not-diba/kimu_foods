import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kimu_foods/core/utils/generics/notifier_state.dart';
import 'package:kimu_foods/core/utils/generics/sliver_header_delegate.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';
import 'package:ming_cute/ming_cute.dart';
import 'package:provider/provider.dart';

import '../../domain/providers/profile_provider.dart';

// TODO: Refactor and clean up code into seperate components

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  bool _isSwitchOn = false;
  bool _isBiometrics = false;

  final List<String> _profileTabs = ['Account', 'Payment', 'Notifications'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _profileTabs.length, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileProvider>(context, listen: false).getProfile();
    });
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
        child: Consumer<ProfileProvider>(
          builder: (context, profileProvider, child) {
            final profile = profileProvider.profileResponse?.data;

            if (profileProvider.state == NotifierState.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (profileProvider.profileResponse == null || profile == null) {
              return const Center(
                child: Text('No data'),
              );
            }

            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    collapsedHeight: MediaQuery.sizeOf(context).height * .15,
                    expandedHeight: MediaQuery.sizeOf(context).height * .3,
                    surfaceTintColor: Colors.transparent,
                    stretchTriggerOffset: 100.0,
                    pinned: true,
                    leading: Padding(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: apricot,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            MingCute.left_line,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Icon(
                            MingCute.settings_3_line,
                            size: 24,
                          ),
                        ),
                      )
                    ],
                    flexibleSpace: LayoutBuilder(
                      builder: (BuildContext context,
                          BoxConstraints boxConstraints) {
                        final double maxExtent =
                            MediaQuery.sizeOf(context).height * .3;
                        final double shrinkOffset =
                            (maxExtent - boxConstraints.maxHeight)
                                .clamp(0, maxExtent);
                        final double scale =
                            1.0 - (shrinkOffset / maxExtent * 0.5);

                        final double rightOffset =
                            0 + (shrinkOffset / maxExtent * 50);

                        return FlexibleSpaceBar(
                          centerTitle: true,
                          titlePadding: const EdgeInsets.only(top: 60),
                          title: SizedBox(
                            height: 150,
                            width: 150,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 150,
                                  child: profile.profileImg?.isNotEmpty == true
                                      ? Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  profile.profileImg!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : SvgPicture.asset(
                                          height: 150,
                                          width: 150,
                                          'lib/core/assets/svgs/avatar_male.svg',
                                        ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: rightOffset,
                                  child: Transform.scale(
                                    scale: scale,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kimuPrimary,
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      width: 36,
                                      height: 36,
                                      child: const Icon(
                                        MingCute.camera_2_line,
                                        size: 22.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 30),
                    sliver: SliverPersistentHeader(
                      pinned: true,
                      floating: false,
                      delegate: SliverAppBarDelegate(
                        height: 55.0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          height: 40,
                          child: TabBar(
                            controller: _tabController,
                            labelPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 0),
                            indicatorPadding: EdgeInsets.zero,
                            tabAlignment: TabAlignment.start,
                            padding: EdgeInsets.zero,
                            isScrollable: true,
                            tabs: _profileTabs
                                .map(
                                  (String tab) => Tab(
                                    text: tab,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: _profileTabs.map((String tabName) {
                  switch (tabName) {
                    case 'Account':
                      return ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 0, bottom: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 24.0),
                              Text(
                                'User Information',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.apply(color: taupe),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: blanchedAlmond,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          MingCute.mail_line,
                                          size: 24.0,
                                          color: taupe,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          profile.email,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Divider(
                                      thickness: .4,
                                      height: .4,
                                      color: taupe,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const Icon(
                                          MingCute.cellphone_line,
                                          size: 24.0,
                                          color: taupe,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          profile.phoneNumber,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Divider(
                                      thickness: .4,
                                      height: .4,
                                      color: taupe,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const Icon(
                                          MingCute.map_pin_line,
                                          size: 24.0,
                                          color: taupe,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          '${profile.county}, ${profile.country}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24.0),
                              Text(
                                'Delivery Instructions',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.apply(color: taupe),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: blanchedAlmond,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          MingCute.building_1_line,
                                          size: 24.0,
                                          color: taupe,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Crest Apartment',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Divider(
                                      thickness: .4,
                                      height: .4,
                                      color: taupe,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const Icon(
                                          MingCute.home_5_line,
                                          size: 24.0,
                                          color: taupe,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'House no. 911, 9th floor',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24.0),
                              Text(
                                'Security Information',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.apply(color: taupe),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: blanchedAlmond,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Password',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                        Text(
                                          '123456'
                                              .replaceAll(RegExp(r'.'), '•'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w900,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Divider(
                                      thickness: .4,
                                      height: .4,
                                      color: taupe,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Two-factor',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                        Transform.scale(
                                          scale: 0.8,
                                          child: SizedBox(
                                            height: 30,
                                            width: 40,
                                            child: Switch(
                                              value: _isSwitchOn,
                                              onChanged: (value) {
                                                setState(() {
                                                  _isSwitchOn = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Divider(
                                      thickness: .4,
                                      height: .4,
                                      color: taupe,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Finger print/Face ID',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                        Transform.scale(
                                          scale: 0.8,
                                          child: SizedBox(
                                            height: 30,
                                            width: 40,
                                            child: Switch(
                                              value: _isBiometrics,
                                              onChanged: (value) {
                                                setState(() {
                                                  _isBiometrics = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24.0),
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0,),
                                  ),
                                  onPressed: () {},
                                  child: const Text('Edit profile'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    case 'Payment':
                      return const Center(child: Text('Payment'));
                    case 'Notifications':
                      return const Center(child: Text('Notifications'));
                    default:
                      return const Center(child: Text('No content available'));
                  }
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
