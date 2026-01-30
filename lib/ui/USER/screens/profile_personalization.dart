import 'package:flutter/material.dart';
import 'package:re_discover/domain/models/cosmetic.dart';
import 'package:re_discover/ui/USER/widgets/profile_picture_card.dart';

class ProfilePersonalization extends StatelessWidget {
  const ProfilePersonalization({super.key, required this.cosmetics});

  final List<Cosmetic> cosmetics;

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
                'Cosmetics',
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
                  ...cosmetics.map((cosmetic) => ProfilePictureCard(
                      iconProfile: cosmetic.img,
                      titleProfile: cosmetic.name,
                      unlocked: false,
                      equipped: false,
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