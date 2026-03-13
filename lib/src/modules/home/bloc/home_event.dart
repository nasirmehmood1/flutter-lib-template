import 'package:equatable/equatable.dart';

/// Events for the [HomeBloc].
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Triggered when the Home screen is first loaded.
class HomeLoadEvent extends HomeEvent {
  const HomeLoadEvent();
}
