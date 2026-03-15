import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(const BottomNavInitial(index: 0)) {
    on<TabChangeEvent>((event, emit) {
      emit(BottomNavInitial(index: event.index));
    });
  }
}
