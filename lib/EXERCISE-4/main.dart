import 'package:flutter/material.dart';
import 'joke.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: JokeList(),
    ),
  ),
);

class JokeList extends StatefulWidget {
  @override
  State<JokeList> createState() => _JokeListState();
}

class _JokeListState extends State<JokeList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return FavoriteCard(
          joke: jokes[index],
          onFavoriteClick: () {
            setState(() {
              jokes[index].isFavorite = !jokes[index].isFavorite;
            });
          },
        );
      },
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final Joke joke;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.joke,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              joke.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: joke.isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
