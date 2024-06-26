import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_tech_task/core/helper/extensions.dart';
import 'package:icon_tech_task/core/routing/routes.dart';
import 'package:icon_tech_task/features/login/logic/cubit/login_cubit.dart';

import '../../../../core/theming/color.dart';
import '../../../../core/theming/styles.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainGreen,
              ),
            ),
          );
        }, success: (loginResponse) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.getRestaurantBanchesScreen,
              predicate: (Route<dynamic> route) {
            return false;
          });
        }, error: (error) {
          setupErrorState(context, error);
        });
      },
      child: const SizedBox.shrink(),
    );
  }
}

void setupErrorState(BuildContext context, String error) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: TextStyles.font15DarkBlueMedium.copyWith(color: Colors.black),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'اغلاق',
            style: TextStyles.font14BlueSemiBold,
          ),
        ),
      ],
    ),
  );
}
