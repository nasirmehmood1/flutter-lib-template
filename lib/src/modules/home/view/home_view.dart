import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application/base_state.dart';
import '../../../service/locator/locator.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
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
    setScreenBackgroundColor = appWhiteSmokeColor;
    _homeBloc = serviceLocator<HomeBloc>();
    _homeBloc.add(const HomeLoadEvent());
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

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: appWhiteSmokeColor,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      title: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: Text(
          'Dashboard',
          style: boldNeutralGreyTextStyle.copyWith(
            fontSize: 24.sp,
            color: midnightBlueColor,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Container(
            decoration: BoxDecoration(
              color: appPrimaryColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8.w),
            child: Icon(
              Icons.notifications_outlined,
              color: appPrimaryColor,
              size: 24.w,
            ),
          ),
        ),
      ],
    );
  }

}
