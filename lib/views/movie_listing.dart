import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _totalTickets = 1;

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
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

            DropdownMenu<int>(
            initialSelection: _totalTickets,
            onSelected: (int? value) {
              if (value != null) {
                setState(() {
                  _totalTickets = value;
                });
              }
            },
            dropdownMenuEntries:  [
            DropdownMenuEntry(value: 1, label: "1 Ticket"),
            DropdownMenuEntry(value: 2, label: "2 Tickets"),
            DropdownMenuEntry(value: 3, label: "3 Tickets"),
            DropdownMenuEntry(value: 4, label: "4 Tickets"),
            DropdownMenuEntry(value: 5, label: "5 Tickets"),
            ]),

            SizedBox(height: 8),

            ElevatedButton(
            onPressed: () {
              final ticketLabel = _totalTickets == 1 ? 'ticket' : 'tickets'; // if its one ticket, use singular, otherwise plural 
              ScaffoldMessenger.of(context).showSnackBar( //inbuilt bottom bar notif
                SnackBar(
                  content: Text('$_totalTickets $ticketLabel added to order'),
                ),
              );
            },
            child: const Text('Add to Basket'),
            ),
            
          ],
        ),
      ),
    );
  }
}
