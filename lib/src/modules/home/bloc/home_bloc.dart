import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

/// BLoC for the Home feature module.
///
/// Manages the state of the Home screen by responding
/// to [HomeEvent]s and emitting [HomeState]s.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// [HomeBloc] event handlers
  HomeBloc() : super(const HomeInitialState()) {
    on<HomeLoadEvent>(_onHomeLoad);
  }

  // ---------------------------------------------------------------------------
  // [HomeBloc] methods
  // ---------------------------------------------------------------------------

  /// Handles [HomeLoadEvent] to fetch and display home screen data.
  Future<void> _onHomeLoad(
    HomeLoadEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState());

    try {
      // TODO: Replace with actual API call via ApiClient.
      await Future.delayed(const Duration(seconds: 1));
      emit(const HomeLoadedState(
        message: 'Welcome to Flutter General Template!',
      ));
    } catch (e) {
      emit(HomeErrorState(error: e.toString()));
    }
  }
}
