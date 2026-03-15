part of 'bottom_nav_bloc.dart';

sealed class BottomNavEvent {}

final class TabChangeEvent extends BottomNavEvent {
  final int index;
  TabChangeEvent({required this.index});
}
