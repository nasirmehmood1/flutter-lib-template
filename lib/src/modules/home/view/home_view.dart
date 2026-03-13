import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../service/locator/locator.dart';

import '../../../application/base_state.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/home_view_widgets.dart';

/// Home screen of the application.
///
/// Demonstrates the recommended architecture pattern:
/// - Extends [BaseState] instead of [State]
/// - Mixes in [HomeViewWidgets] for UI components
/// - Uses [BlocBuilder] to react to state changes
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewWidgets {
  /// Variables
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = serviceLocator<HomeBloc>();
    _homeBloc.add(const HomeLoadEvent());
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Home'),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _homeBloc,
      builder: (BuildContext context, HomeState state) {
        if (state is HomeLoadingState) {
          return buildLoadingState();
        }
        if (state is HomeLoadedState) {
          return buildLoadedContent(state.message);
        }
        if (state is HomeErrorState) {
          return buildErrorState(state.error);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
