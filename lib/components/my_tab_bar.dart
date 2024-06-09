import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const MyTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      tabAlignment: TabAlignment.center,
      tabs: const [
        Tab(icon: Text('#')),
        Tab(icon: Text('A')),
        Tab(icon: Text('B')),
        Tab(icon: Text('C')),
        Tab(icon: Text('D')),
        Tab(icon: Text('E')),
        Tab(icon: Text('F')),
        Tab(icon: Text('G')),
        Tab(icon: Text('H')),
        Tab(icon: Text('I')),
        Tab(icon: Text('J')),
        Tab(icon: Text('K')),
        Tab(icon: Text('L')),
        Tab(icon: Text('M')),
        Tab(icon: Text('N')),
        Tab(icon: Text('O')),
        Tab(icon: Text('P')),
        Tab(icon: Text('Q')),
        Tab(icon: Text('R')),
        Tab(icon: Text('S')),
        Tab(icon: Text('T')),
        Tab(icon: Text('U')),
        Tab(icon: Text('V')),
        Tab(icon: Text('W')),
        Tab(icon: Text('X')),
        Tab(icon: Text('Y')),
        Tab(icon: Text('Z')),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
