import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listview_animation/core/model/genre.dart';

enum AnimationType {
  Scale,
  Fade,
  Size,
}

class AnimatedSwitcherGenreListItem extends StatelessWidget {
  final Genre genre;
  final VoidCallback? onCardTap;
  final AnimationType animationType;

  AnimatedSwitcherGenreListItem({
    required this.genre,
    required this.animationType,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (Widget child, Animation<double> animation) {
        if (animationType == AnimationType.Scale) {
          return ScaleTransition(child: child, scale: animation);
        } else if (animationType == AnimationType.Fade) {
          return FadeTransition(child: child, opacity: animation);
        } else if (animationType == AnimationType.Size) {
          return SizeTransition(child: child, sizeFactor: animation);
        } else {
          throw Exception();
        }
        // return ScaleTransition(child: child, scale: animation);
        // return FadeTransition(child: child, opacity: animation);
        // return SizeTransition(child: child, sizeFactor: animation);
      },
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        key: ValueKey<bool>(genre.isSelected),
        // The difference in this value will determine whether animation will run.
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
      ),
    );
  }
}
