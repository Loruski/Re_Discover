import 'package:flutter/material.dart';
import 'package:re_discover/ui/LEADERBOARD/utils/leaderboard_header_sliver_delegate.dart';
import 'package:re_discover/ui/LEADERBOARD/widgets/leaderboard_scroll_view.dart';
import 'package:re_discover/ui/LEADERBOARD/widgets/user_leaderboard_place_card.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

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
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: 100,
              flexibleSpace: FlexibleSpaceBar( //TODO unite title and usercard using customlayout and taking inspiration from FlexibleSpaceBar
                centerTitle: true,
                title: Text(
                  'Leaderboard',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                stretchModes: [
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
              ),
              // bottom: UserLeaderboardPlaceCard(),
            ),
            SliverAppBar(
              pinned: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              collapsedHeight: 75,
              bottom: UserLeaderboardPlaceCard(),
            ),
                
            SliverPersistentHeader(
              pinned: true,
              delegate: LeaderboardHeaderSliverDelegate(
                tabBar: TabBar(
                  controller: _tabController,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: const [
                    Tab(text: 'Global'),
                    Tab(text: 'Local'),
                    Tab(text: 'Friends'),
                  ],
                ),
              ),
            ),
          ],
          body: LeaderboardScrollView(tabController: _tabController),
        ),
      ),
    );
  }
}
