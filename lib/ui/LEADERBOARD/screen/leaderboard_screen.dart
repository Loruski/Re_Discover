import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:re_discover/ui/LEADERBOARD/widgets/leaderboard_scroll_view.dart';
import 'package:re_discover/ui/LEADERBOARD/widgets/preferred_size_tabbar_card.dart';
import 'package:re_discover/ui/LEADERBOARD/widgets/user_leaderboard_place_card.dart';

enum Categories {
  xp("XP"),
  distanceTraveled("Distance Traveled"),
  quizPrecision("Quiz Precision");

  const Categories(this.name);

  final String name;
}

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen>
    with TickerProviderStateMixin {
  Categories selectedCategory = Categories.xp;

  late final TabController _tabController;

  // late DropdownButton<Categories> dropdown =

  // DropdownMenu(
  //   enableSearch: false,
  //   initialSelection: Categories.xp,
  //   // menuController: ,
  //   // menuStyle: MenuStyle(
  //   //   minimumSize: WidgetStatePropertyAll(Size.fromHeight(100.0)),
  //   //   maximumSize: WidgetStatePropertyAll(Size.fromHeight(300)),
  //   // ),
  //   dropdownMenuEntries: Categories.values
  //       .map(
  //         (category) =>
  //             DropdownMenuEntry(value: category, label: category.name),
  //       )
  //       .toList(),
  // );

  late final PreferredSizeWidget tabBar = PreferredSizeTabbarCard(
    tabController: _tabController,
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),

        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            // centerTitle: true,
            pinned: true,
            floating: true,
            actions: [
              DropdownButton(
                      value: selectedCategory,
                      items: Categories.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => {
                        setState(() {
                          selectedCategory = value ?? Categories.xp;
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
              // centerTitle: true,
              // centerTitle: true,
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
          LeaderboardScrollView(tabController: _tabController),
        ],
      ),
    );
  }
}
