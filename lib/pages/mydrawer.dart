import 'package:flutter/material.dart';

import 'favourite_page.dart';
import 'home_page.dart';
import 'profile.dart';
import 'track_order.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Padding(padding: EdgeInsets.zero),
        ),
        Column(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'Home',
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                )); // Close the drawer.
              },
            ),
            ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favorite'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FavouritePage();
                  }));
                }),
            ListTile(
              leading: const Icon(Icons.fire_truck),
              title: const Text('Track Order'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TrackOrderPage();
                }));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: GestureDetector(child: const Text('Profile')),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfilePage();
                }));
              },
            ),
          ],
        )
      ],
    ));
  }
}
