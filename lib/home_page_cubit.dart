import 'package:bloc/bloc.dart';
import 'package:listview_animation/home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageDrawerState(index: 0));

  int? _drawerIndex;

  void toIndex(int index) {
    _drawerIndex = index;
    emit(HomePageDrawerState(index: _drawerIndex ?? 0));
  }

  int getDrawerSelectedIndex() {
    return _drawerIndex ?? 0;
  }

  String getAppbarTitle() {
    var title = '';
    switch (_drawerIndex) {
      case 0: title = 'No animation'; break;
      case 1: title = 'Scale Transition'; break;
      case 2: title = 'Fade Transition'; break;
      case 3: title = 'Size Transition'; break;
      default: title = '';
    }
    return title;
  }
}
