import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {

    return const [

      Movie(

        id: 'dune',
        title: 'Dune: Part Two (2024)',
        description: 'The war for Arrakis begins. Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
        runTime: '2h 46m',
        imagePath: 'assets/images/dune2Poster1.jfif',

      ),

      Movie(

        id: 'batman',
        title: 'The Batman (2022)',
        description: 'In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.',
        runTime: '2h 56m',
        imagePath: 'assets/images/theBatmanPoster.jfif',

      )

    ];

  }
}