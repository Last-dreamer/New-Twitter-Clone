import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:twitter_clone/presentation/pages/auth/widgets/custom_button.dart';

import '../../../core/routes/router.gr.dart';
import '../../common/widgets/snack_bar.dart';
import 'cubit/login_cubit_cubit.dart';
import 'cubit/login_cubit_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.theme,
    required this.email,
    required this.password,
    required this.width,
    required this.height,
    required this.mainHorizontalPadding,
  });

  final ThemeData theme;
  final TextEditingController email;
  final TextEditingController password;
  final double width;
  final double height;
  final double mainHorizontalPadding;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is LoginCubitErrorState) {
          CustomSnackBar(
                  error: true, text: "Error: ${state.error}", context: context)
              .showSnackbar();
        }
        if (state is LoginCubitSuccessState) {
          CustomSnackBar(
                  error: false, text: "Successfully login", context: context)
              .showSnackbar();

          context.router.push(const MainRoute());
        }
      },
      builder: (context, state) {
        return BlocBuilder<LoginCubit, LoginCubitState>(
          builder: (context, state) {
            return CustomButton(
                onTap: () => context
                    .read<LoginCubit>()
                    .login(email: email.text, password: password.text),
                shouldAnimated:
                    (context.watch<LoginCubit>().state is LoginCubitErrorState)
                        ? false
                        : context.watch<LoginCubit>().state
                                is LoginCubitLoadingState
                            ? true
                            : false,
                text: "LOGIN",
                width: width,
                height: height,
                mainHorizontalPadding: mainHorizontalPadding,
                theme: theme);
          },
        );
      },
    );
  }
}
