# flutter-animation-switcher

Expand/collapse animation on `ListView` items or `Row/Column of Widgets` with BLoC/Cubit architecture.

What we need to do is wrap childs in `AnimationSwitcher` widget for animation since there is no [DiffUtil](https://www.google.com/search?q=diffutil+android&rlz=1C5CHFA_enMY955MY956&oq=diffutil+android&aqs=chrome..69i57j0i512l3j0i22i30j69i60l3.1750j0j4&sourceid=chrome&ie=UTF-8) equivalent in Dart world.

Example:
```dart  
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
        // return FadeTransition(child: child, opacity: animation);
        // return SizeTransition(child: child, sizeFactor: animation);
      },
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        key: ValueKey<bool>(widget.isSelected), // The difference in this value will determine whether animation will run.
        child: Container(
           // Your code
        )
      );
  }
```

You can check out files at below for relevant code
```
presentation
- bloc
  - list_cubit.dart
  - list_state.dart
- widgets
  - animated_switcher_screen.dart
```

| No animation | Scale transition  | 
| :---------: |:---------:|
| ![Simulator Screen Recording - iPhone 12 Pro Max - 2021-11-22 at 01 14 37](https://user-images.githubusercontent.com/35066207/142772209-22fb1895-7613-4926-891f-4cd05bdf220b.gif) | ![Simulator Screen Recording - iPhone 12 Pro Max - 2021-11-22 at 01 25 06](https://user-images.githubusercontent.com/35066207/142772561-0c13df33-4e69-4c15-95cb-f7d49357d58d.gif)

| Fade transition | Size transition  | 
| :---------: |:---------:|
|![Simulator Screen Recording - iPhone 12 Pro Max - 2021-11-22 at 01 25 21](https://user-images.githubusercontent.com/35066207/142772598-b8f2084f-db88-4048-a32b-517c3c799279.gif)| ![Simulator Screen Recording - iPhone 12 Pro Max - 2021-11-22 at 01 25 39](https://user-images.githubusercontent.com/35066207/142772602-8a920807-1263-414f-97a5-46333a7032d9.gif) |

