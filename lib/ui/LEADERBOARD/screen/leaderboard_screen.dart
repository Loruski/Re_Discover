import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';

import 'package:re_discover/ui/LEADERBOARD/widgets/leaderboard_scroll_view.dart';
import 'package:re_discover/ui/LEADERBOARD/widgets/preferred_size_tabbar_card.dart';
import 'package:re_discover/ui/LEADERBOARD/widgets/user_leaderboard_place_card.dart';

enum Categories {
  xp("XP", Icons.diamond),
  distanceTraveled("Distance Traveled", Icons.map_outlined),
  quizPrecision("Quiz Precision", Icons.quiz_outlined);

  const Categories(this.name, this.icon);

  final String name;

  final IconData icon;
}

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen>
    with TickerProviderStateMixin {
  Categories selectedCategory = Categories.values[0];

  late final TabController _tabController;

  late final PageController _pageController;

  late final PreferredSizeWidget tabBar;

  late final LeaderboardScrollView leaderboardScrollView;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _pageController = PageController(
      initialPage: _tabController.index,
      keepPage: true,
    );

    _tabController.addListener(
      () => _tabController.indexIsChanging
          ? _pageController.animateToPage(
              _tabController.index,
              duration: Durations.medium4,
              curve: Curves.ease,
            )
          : null,
    );

    tabBar = PreferredSizeTabbarCard(tabController: _tabController);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),

        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            scrolledUnderElevation: 0,
            // centerTitle: true,
            pinned: true,
            floating: true,
            actions: [

              CoolDropdown(
                defaultItem: CoolDropdownItem(
                  value: selectedCategory,
                  label: selectedCategory.name,
                  icon: Icon(selectedCategory.icon) 
                ),
                dropdownList: Categories.values
                    .map(
                      (category) => CoolDropdownItem(
                        value: category,
                        label: category.name,
                        icon: Icon(category.icon)
                      ),
                    )
                    .toList(),
                controller: DropdownController(),
                onChange: (value) =>
                    (value) => {
                      setState(() {
                        selectedCategory = value ?? Categories.values[0];
                      }),
                    },
              ),
            ],
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            collapsedHeight: tabBar.preferredSize.height + 24,
            expandedHeight: 200,
            bottom: tabBar,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16.0 + tabBar.preferredSize.height,
              ),
              title: Text(
                'Leaderboard',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              stretchModes: [StretchMode.blurBackground, StretchMode.fadeTitle],
            ),
          ),
          PinnedHeaderSliver(
            // child: SliverResizingHeader(child: UserLeaderboardPlaceCard()),
            child: UserLeaderboardPlaceCard(),
          ),
        ],
        body: PageView.builder(
          itemCount: _tabController.length,
          controller: _pageController,
          onPageChanged: (value) => !_tabController.indexIsChanging
              ? _tabController.animateTo(value)
              : null,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => LeaderboardScrollView(
            leaderboardType: LeaderboardType.values[index],
          ),
        ),
      ),
    );
  }
}
