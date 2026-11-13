import 'package:facebook_ui/core/constants/app_assets.dart';
import 'package:facebook_ui/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_tap_screen.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 6, vsync: this);

    _tabController.addListener(() {
      setState(() {});
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
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.whiteColor,
                elevation: 0,
                scrolledUnderElevation: 0,
                floating: false,
                pinned: false,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(AppAssets.plusIcon, width: 26),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(AppAssets.searchIcon, width: 22),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(AppAssets.messengerIcon, width: 22),
                  ),
                ],
                title: SvgPicture.asset(AppAssets.facebookLogoSVG, width: 156),
                bottom: TabBar(
                  controller: _tabController,
                  labelColor: AppColors.blueColor, // Selected icons
                  unselectedLabelColor: AppColors.grayColor, // Unselected icons
                  indicatorColor: AppColors.blueColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 2,
                  tabs: [
                    Tab(
                      icon: Icon(
                        _tabController.index == 0
                            ? Icons.home
                            : Icons.home_outlined,
                        size: 26,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        _tabController.index == 1
                            ? Icons.ondemand_video
                            : Icons.ondemand_video_outlined,
                        size: 26,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        _tabController.index == 2
                            ? Icons.storefront
                            : Icons.storefront_outlined,
                        size: 26,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        _tabController.index == 3
                            ? Icons.person
                            : Icons.person_outline,
                        size: 26,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        _tabController.index == 4
                            ? Icons.notifications
                            : Icons.notifications_none,
                        size: 26,
                      ),
                    ),
                    Tab(
                      icon: CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage(AppAssets.model1),
                      ),
                    ), // Menu / Profile
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              HomeTapScreen(),
              const Center(child: Text('Wishlist Screen')),
              const Center(child: Text('Store Screen')),
              const Center(child: Text('Profile Screen')),
              const Center(child: Text('Notifications Screen')),
              const Center(child: Text('Profile Screen')),
            ],
          ),
        ),
      ),
    );
  }
}
