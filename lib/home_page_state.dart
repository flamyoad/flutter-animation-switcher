abstract class HomePageState {
  int? index;
}

class HomePageDrawerState extends HomePageState {
  final int index;

  HomePageDrawerState({required this.index});
}
