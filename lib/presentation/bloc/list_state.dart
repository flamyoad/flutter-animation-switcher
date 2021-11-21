import 'package:equatable/equatable.dart';
import 'package:listview_animation/core/model/genre.dart';

abstract class ListState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListLoadingState extends ListState {}

class ListLoadedState extends ListState {
  final List<Genre> genreItems;
  final bool isExpanded;

  ListLoadedState(this.genreItems, this.isExpanded);

  @override
  List<Object> get props => [genreItems, isExpanded];
}
