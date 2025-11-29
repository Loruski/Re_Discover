import 'package:flutter/material.dart';

class PreferredSizeTabbarCard extends StatelessWidget implements PreferredSizeWidget{
  final TabController tabController;


  const PreferredSizeTabbarCard({super.key, required this.tabController});


  @override
  Widget build(BuildContext context) {
    return Card(child: TabBar(
                controller: tabController,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
                indicatorColor: Theme.of(context).primaryColor,
                tabs: const [
                  Tab(text: 'Global'),
                  Tab(text: 'Local'),
                  Tab(text: 'Friends'),
                ],
              )
 );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}