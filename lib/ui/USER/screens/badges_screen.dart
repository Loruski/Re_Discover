import 'package:flutter/material.dart';
import 'package:re_discover/ui/USER/widgets/badge_card.dart';
import 'package:re_discover/domain/models/badge.dart' as models;

class BadgesScreen extends StatelessWidget{
  const BadgesScreen({super.key, required this.badges});

  final List<models.Badge> badges;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              scrolledUnderElevation: 0,
              pinned: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                'Your Badges',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  ...badges.map((badge) => BadgeCard(
                      iconCard: badge.img,
                      titleCard: badge.name,
                      infoCard: badge.description,
                      unlocked: false
                  )),
                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}
