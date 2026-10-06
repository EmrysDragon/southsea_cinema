import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieCard extends StatelessWidget {
  int _totalTickets = 1;
  final Movie movie;

  MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: cinemaSurface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 32,
                      color: cinemaBrand,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  '(${movie.ageRating})',
                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                ),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.description, style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 8.0),
                      Text(
                        '(Run time: ${movie.runTime} mins)',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Book Tickets',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Screening Time: ${movie.screeningTime}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cinemaBrand,
                  ),
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
                  child: const Text(
                    'Book Now',
                    style: TextStyle(color: cinemaFontWhite),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}