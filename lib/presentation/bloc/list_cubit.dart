import 'package:bloc/bloc.dart';
import 'package:listview_animation/core/model/genre.dart';
import 'package:listview_animation/presentation/bloc/list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListLoadingState());

  final String loremIpsum =
      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem';

  List<Genre> _listGenre = [];
  bool _isExpanded = false;

  void initialize() {
    _listGenre = [
      Genre(
        name: 'Action',
        description: loremIpsum,
      ),
      Genre(name: 'Adventure', description: loremIpsum),
      Genre(name: 'Comedy', description: loremIpsum),
      Genre(name: 'Drama', description: loremIpsum),
      Genre(name: 'Historical', description: loremIpsum),
      Genre(name: 'Martial Arts', description: loremIpsum),
      Genre(name: 'Scifi', description: loremIpsum),
      Genre(name: 'Doggo', description: loremIpsum),
    ];
    emit(ListLoadedState(_listGenre, _isExpanded));
  }

  void onGenreClick(Genre genre) {
    _listGenre = _listGenre
        .map((e) =>
            e.copyWith(e.name == genre.name ? !e.isSelected : e.isSelected))
        .toList();
    emit(ListLoadedState(_listGenre, _isExpanded));
  }

  void expandList() {
    _isExpanded = !_isExpanded;
    emit(ListLoadedState(_listGenre, _isExpanded));
  }
}
