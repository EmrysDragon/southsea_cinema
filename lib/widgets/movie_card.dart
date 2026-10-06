import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieCard extends StatelessWidget {
  int _totalTickets = 0;
  final Movie movie;

  MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(

      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(movie.title, style: TextStyle(fontSize: 32, color: cinemaBrand, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8.0),
                Text('(${movie.ageRating})', style: TextStyle(fontSize: 20, color: Colors.grey[700])),

              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Image.asset(
                  movie.imagePath,
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),

                const SizedBox(width: 16.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.description, style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 8.0),
                    Text('(Run time: ${movie.runTime} mins)', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                  ],
                ),
              ],
            ),

            Text('Book Tickets', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Screening Time: ${movie.screeningTime}',
                  style: const TextStyle(fontSize: 20),
                ),

                const SizedBox(width: 16.0),

                DropdownMenu<int>(
                  initialSelection: 1,
                  onSelected: (int? value) {
                    if (value != null) {
                      _totalTickets = value;
                    }
                  },
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 1, label: '1 Ticket'),
                    DropdownMenuEntry(value: 2, label: '2 Tickets'),
                    DropdownMenuEntry(value: 3, label: '3 Tickets'),
                    DropdownMenuEntry(value: 4, label: '4 Tickets'),
                    DropdownMenuEntry(value: 5, label: '5 Tickets'),
                  ],
                ),

                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    final ticketLabel = _totalTickets == 1 ? 'ticket' : 'tickets';
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '$_totalTickets $ticketLabel added to order for ${movie.title}',
                        ),
                      ),
                    );
                  },

                  child: const Text('Book Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}