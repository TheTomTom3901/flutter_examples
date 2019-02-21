import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

const TITLE = 'Random Words Example';

class RandomWordsApp extends StatelessWidget {
  const RandomWordsApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      home: const RandomWordsPage(),
      theme: ThemeData.dark(),
    );
  }
}

class RandomWordsPage extends StatefulWidget {
  const RandomWordsPage({
    Key key,
  }) : super(key: key);

  @override
  RandomWordsPageState createState() => RandomWordsPageState();
}

class RandomWordsPageState extends State<RandomWordsPage> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        if (index.isOdd) return const Divider(height: 2);
        
        if (index >= _suggestions.length) _suggestions.addAll(generateWordPairs().take(10));
        
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair wordPair) {
    final bool alreadySaved = _saved.contains(wordPair);

    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.pink : null,
        size: 28,
      ),
      onTap: () {
        setState(() {
          return alreadySaved ? _saved.remove(wordPair) : _saved.add(wordPair);
        });
      },
    );
  }

  void _pushedSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      final Iterable<ListTile> titles = _saved.map((wordPair) {
        return ListTile(
          title: Text(
            wordPair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
    
      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: titles,
      ).toList();
    
      return Scaffold(
        appBar: AppBar(
          title: const Text('Saved Suggestions'),
        ),
        body: divided.isNotEmpty
            ? ListView(children: divided)
            : Center(
          child: Text(
            'No names saved',
            style: _biggerFont,
          ),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TITLE),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushedSaved,
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}

