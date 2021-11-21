import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listview_animation/presentation/widgets/animated_switcher_screen.dart';
import 'package:listview_animation/presentation/widgets/normal_screen.dart';
import 'package:listview_animation/presentation/widgets/shared/animated_switcher_genre_list_item.dart';

import 'home_page_cubit.dart';
import 'home_page_state.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomePageCubit _homePageCubit;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _homePageCubit = BlocProvider.of<HomePageCubit>(context);
    _pageController =
        PageController(initialPage: _homePageCubit.getDrawerSelectedIndex());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _homePageCubit,
      listener: (p, c) {
        if (c is HomePageDrawerState) {
          _pageController.jumpToPage(c.index);
          Navigator.of(context).pop(); // Closed drawer
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: _buildDrawer(),
          appBar: AppBar(
            title: Text(_homePageCubit.getAppbarTitle()),
            brightness: Brightness.dark,
          ),
          body: _buildBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () => null,
            tooltip: 'Reset',
            child: Icon(Icons.refresh),
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    return PageView.builder(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return NormalScreen();
          case 1:
            return AnimatedSwitcherScreen(AnimationType.Scale);
          case 2:
            return AnimatedSwitcherScreen(AnimationType.Fade);
          case 3:
            return AnimatedSwitcherScreen(AnimationType.Size);
          default:
            return NormalScreen();
        }
      },
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Animated Switcher',
                style: TextStyle(color: Colors.white),
              )),
          _buildDrawerItem(
            title: 'No animation',
            onItemClicked: () {
              _homePageCubit.toIndex(0);
            },
          ),
          _buildDrawerItem(
            title: 'Animated Switcher - Scale Transition',
            onItemClicked: () {
              _homePageCubit.toIndex(1);
            },
          ),
          _buildDrawerItem(
            title: 'Animated Switcher - Fade Transition',
            onItemClicked: () {
              _homePageCubit.toIndex(2);
            },
          ),
          _buildDrawerItem(
            title: 'Animated Switcher - Size Transition',
            onItemClicked: () {
              _homePageCubit.toIndex(3);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      {required String title, VoidCallback? onItemClicked}) {
    return ListTile(
      leading: const Icon(Icons.local_movies_outlined),
      title: Text(title),
      onTap: onItemClicked,
    );
  }
}
