import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/common/snack/app_alert_dropdown.dart';
import 'package:math_game/common/snack/app_alert_dropdown_source.dart';
import 'package:math_game/common/snack/snack_bloc.dart';
import 'package:math_game/common/snack/snack_bloc_state.dart';

@RoutePage()
class AppWrapperScreen extends StatelessWidget implements AutoRouteWrapper {
  const AppWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SnackBloc, SnackBlocState>(
      listener: (context, state) {
        if (state is SnackBlocStateShowStringError) {
          showTopSnackBar(
            context,
            AppAlertDropDown(errorMessage: state.message, isError: true),
          );
        }
      },
      child: const AutoRouter(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
