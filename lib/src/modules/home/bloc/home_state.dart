import 'package:equatable/equatable.dart';

/// States for the [HomeBloc].
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any data has been loaded.
class HomeInitialState extends HomeState {
  const HomeInitialState();
}

/// State while data is being fetched.
class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

/// State when data has been successfully loaded.
class HomeLoadedState extends HomeState {
  /// The loaded message or data to display.
  final String message;

  const HomeLoadedState({required this.message});

  @override
  List<Object?> get props => [message];
}

/// State when an error has occurred.
class HomeErrorState extends HomeState {
  /// The error message describing what went wrong.
  final String error;

  const HomeErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
