import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listview_animation/core/model/genre.dart';

class GenreListItem extends StatelessWidget {
  final Genre genre;
  final VoidCallback? onCardTap;

  GenreListItem({
    required this.genre,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        genre.name ?? '',
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                      if (genre.isSelected)
                        Text(
                          genre.description ?? '',
                          overflow: TextOverflow.fade,
                          style: TextStyle(color: Colors.black45, fontSize: 14),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
