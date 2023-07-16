
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/custom_button.dart';

import '../../../core/routes/router.gr.dart';
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
        if(state is LoginCubitErrorState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${state.error}"), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating,));
        }
        if(state is LoginCubitSuccessState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Successfully login"), backgroundColor: theme.colorScheme.secondary, behavior: SnackBarBehavior.floating));
          context.router.push(const TweetRoute());
        }
      },
      builder: (context, state) {
        return BlocBuilder<LoginCubit, LoginCubitState>(
          builder: (context, state) {

            log("testing state $state");
            
            return  CustomButton(
                   onTap: () => context.read<LoginCubit>().login(
                      email: email.text, password: password.text),
                      shouldAnimated: (context.watch<LoginCubit>().state is LoginCubitErrorState) ? false : context.watch<LoginCubit>().state is LoginCubitLoadingState ? true :   false,
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
