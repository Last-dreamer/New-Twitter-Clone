import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:twitter_clone/presentation/core/routes/router.gr.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/login_cubit_cubit.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/login_cubit_state.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/should_show_bg_color.dart';

import 'package:twitter_clone/presentation/pages/auth/widgets/custom_button.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/custom_textfield.dart';
import 'package:auto_route/auto_route.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var mainHorizontalPadding = .07;

  var backgroundColor = false;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // physics:const NeverScrollableScrollPhysics(),
          child: Container(
            height: height,
            padding:
                EdgeInsets.symmetric(horizontal: width * mainHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Hero(
                  tag: "background_color",
                  child: Container(
                    height:
                        0.0, // Adjust the size according to your text field size
                    color: Colors.transparent,
                  ),
                ),
                Container(
                  child: Lottie.asset("assets/login.json", repeat: true),
                ),
                Text("Login",
                    style: theme.textTheme.displayLarge
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 30)),
                SizedBox(
                  height: width * .05,
                ),
                Text("Please sign in to continue",
                    style: theme.textTheme.bodyMedium),
                SizedBox(
                  height: width * .07,
                ),
                CustomTextField(
                  key: const ValueKey(1),
                  controller: email,
                  hintText: "Email",
                  iconData: Icons.email,
                  width: width,
                  theme: theme,
                  showBackgroundColor:
                      context.watch<ShouldShowBdColor>().state == 1,
                  onTap: () => context
                      .read<ShouldShowBdColor>()
                      .changeBackgroundColor(1),
                ),
                SizedBox(
                  height: width * .05,
                ),
                CustomTextField(
                  key: const ValueKey(2),
                  controller: password,
                  hintText: "Password",
                  iconData: Icons.lock_open,
                  width: width,
                  theme: theme,
                  obscure: true,
                  showBackgroundColor:
                      context.watch<ShouldShowBdColor>().state == 2,
                  onTap: () => context
                      .read<ShouldShowBdColor>()
                      .changeBackgroundColor(2),
                ),
                SizedBox(
                  height: width * .05,
                ),
                BlocBuilder<LoginCubit, LoginCubitState>(
                  builder: (context, state) {

                    if(state is LoginCubitLoadingState){
                      return const CircularProgressIndicator();
                    }

                    if(state is LoginCubitErrorState) {
                      return CustomButton(
                        onTap: () => context
                            .read<LoginCubit>()
                            .login(email: email.text, password: password.text),
                        text: state.error,
                        width: width,
                        mainHorizontalPadding: mainHorizontalPadding,
                        theme: theme);
                    }

                    if(state is LoginCubitSuccessState){
                      return CustomButton(
                        onTap: () => context
                            .read<LoginCubit>()
                            .login(email: email.text, password: password.text),
                        text: "LOGIN",
                        width: width,
                        mainHorizontalPadding: mainHorizontalPadding,
                        theme: theme);
                    }
                    return const Text("Somethig Wrong");
                  },
                ),
                SizedBox(
                  height: width * .02,
                ),
                SizedBox(
                    width: width,
                    child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: theme.colorScheme.secondary),
                    )),
                const Spacer(),
                dontHaveAccount(context, width, theme),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container dontHaveAccount(
      BuildContext context, double width, ThemeData theme) {
    return Container(
      width: width,
      alignment: Alignment.center,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Don't have an account? ", style: theme.textTheme.labelLarge),
        TextSpan(
            text: "Sign up",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                log("working");
                context.router.push(RegisterRoute());
              },
            style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.w900)),
      ])),
    );
  }
}
