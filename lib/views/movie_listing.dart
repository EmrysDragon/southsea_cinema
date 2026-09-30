import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text('Dune: Part Two (2024)', style: TextStyle(fontSize: 32)),
            SizedBox(height: 16),
            Text('Southsea Cinema Room', style: TextStyle(fontSize: 20)),
            Text('Wednesday, 30th September 2026, 18:00 - ends at 20:46', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('Please note that Discounts / Membership benefits will be applied once you have selected your tickets', style: TextStyle(fontSize: 20)),
            Text('Select Quantities (Up to 5 in total)', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text('Tickets', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
          ],
        ),
      ),
    );
  }
}
