import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_general_template/src/modules/home/view/home_view.dart';
import '../bloc/bottom_nav_bloc.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: const _BottomNavBody(),
    );
  }
}

class _BottomNavBody extends StatelessWidget {
  const _BottomNavBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.index,
            children: const [
              HomeView(),
              Center(child: Text('Search')),
              Center(child: Text('Notifications')),
              Center(child: Text('Profile')),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.index,
            onDestinationSelected: (index) {
              context.read<BottomNavBloc>().add(TabChangeEvent(index: index));
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.search_outlined),
                selectedIcon: Icon(Icons.search),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.notifications_outlined),
                selectedIcon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
