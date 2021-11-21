import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listview_animation/presentation/bloc/list_cubit.dart';
import 'package:listview_animation/presentation/bloc/list_state.dart';
import 'package:listview_animation/presentation/widgets/shared/genre_list_item.dart';

class NormalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NormalScreenState();
}

class NormalScreenState extends State<NormalScreen> {
  late ListCubit _listCubit;

  @override
  void initState() {
    super.initState();
    _listCubit = BlocProvider.of<ListCubit>(context);
    _listCubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _listCubit,
      buildWhen: (p, c) => c is ListLoadedState,
      builder: (context, state) {
        if (state is ListLoadedState) {
          var itemShown =
              (state.isExpanded ? state.genreItems : state.genreItems.take(4))
                  .toList();
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  itemCount: itemShown.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = itemShown[index];
                    return GenreListItem(
                      genre: item,
                      onCardTap: () {
                        _listCubit.onGenreClick(item);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 4,
                    );
                  },
                ),
                SizedBox(height: 12),
                _buildExpandButton(state.isExpanded),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildExpandButton(bool currentlyExpanded) {
    return InkWell(
      child: Text(
        currentlyExpanded ? 'Collapse' : 'Expand',
        style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20),
      ),
      onTap: () {
        _listCubit.expandList();
      },
    );
  }
}
