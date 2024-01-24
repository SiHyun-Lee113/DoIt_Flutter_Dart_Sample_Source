import 'package:flutter/material.dart';

void main() {
  runApp(ParentWidget());
}

class ParentWidget extends StatefulWidget {
  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool favorite = false;
  int favoriteCount = 10;

  void toggleFavorite() {
    setState(() {
      if (favorite) {
        favoriteCount -= 1;
        favorite = false;
      } else {
        favoriteCount += 1;
        favorite = true;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Parent State Control Test'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWidget(favorite, toggleFavorite),
            ContentWidget(favoriteCount)
          ],
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final bool favorite;
  final Function onChanged;


  IconWidget(this.favorite, this.onChanged);

  void _handleTap() {
    onChanged();
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: (favorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border)),
        iconSize: 200,
        color: Colors.red,
        onPressed: _handleTap,
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  final int favoriteCount;
  
  ContentWidget(this.favoriteCount);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            'favoriteCount : $favoriteCount',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
