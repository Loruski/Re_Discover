import 'package:flutter/material.dart';
import 'package:re_discover/ui/LEADERBOARD/utils/leaderboard_header_sliver_delegate.dart';
import 'package:re_discover/ui/LEADERBOARD/widgets/leaderboard_scroll_view.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Leaderboard',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: 0,
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: LeaderboardHeaderSliverDelegate(
                tabBar: TabBar(
                  controller: _tabController,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Theme.of(
                    context,
                  ).colorScheme.surfaceDim,
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
