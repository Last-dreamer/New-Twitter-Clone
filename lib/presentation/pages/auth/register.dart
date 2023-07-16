import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/register_cubit_cubit.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/should_show_bg_color.dart';

import 'package:twitter_clone/presentation/pages/auth/widgets/custom_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/custom_textfield.dart';
import 'package:twitter_clone/theme.dart';

import '../../core/routes/router.gr.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  var mainHorizontalPadding = .07;
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

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
            padding: EdgeInsets.symmetric(
                horizontal: width * mainHorizontalPadding,
                vertical: width * mainHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                    onTap: () => context.router.removeLast(),
                    child: Icon(Icons.arrow_back,
                        color: AppTheme.darkTheme.secondaryHeaderColor)),
                SizedBox(
                  height: width * .07,
                ),
                Hero(
                  tag: 'background_color',
                  child: Container(
                    height:
                        10.0, // Adjust the size according to your text field size
                    color: Colors.transparent,
                  ),
                ),

                Text("Create Account",
                    style: theme.textTheme.displayLarge
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 30)),
                SizedBox(
                  height: width * .01,
                ),
                Text("Please fill the  input below here",
                    style: theme.textTheme.bodyMedium),
                SizedBox(height: width * .04),

                // ! ****** start textfield from here .....

                SizedBox(
                  height: height / 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        key: const ValueKey(1),
                        controller: username,
                        hintText: "User Name",
                        iconData: Icons.person_2,
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
                        controller: email,
                        hintText: "Email",
                        iconData: Icons.email,
                        width: width,
                        theme: theme,
                        showBackgroundColor:
                            context.watch<ShouldShowBdColor>().state == 2,
                        onTap: () => context
                            .read<ShouldShowBdColor>()
                            .changeBackgroundColor(2),
                      ),
                      SizedBox(
                        height: width * .05,
                      ),
                      CustomTextField(
                        key: const ValueKey(3),
                        hintText: "Password",
                        iconData: Icons.lock_open,
                        width: width,
                        theme: theme,
                        showBackgroundColor:
                            context.watch<ShouldShowBdColor>().state == 3,
                        obscure: true,
                        onTap: () => context
                            .read<ShouldShowBdColor>()
                            .changeBackgroundColor(3),
                        controller: password,
                      ),
                      SizedBox(
                        height: width * .05,
                      ),
                      CustomTextField(
                        key: const ValueKey(4),
                        controller: confirmPassword,
                        hintText: "Confirm Password",
                        iconData: Icons.lock,
                        width: width,
                        theme: theme,
                        showBackgroundColor:
                            context.watch<ShouldShowBdColor>().state == 4,
                        obscure: true,
                        onTap: () => context
                            .read<ShouldShowBdColor>()
                            .changeBackgroundColor(4),
                      ),
                      SizedBox(
                        height: width * .1,
                      ),
                    ],
                  ),
                ),

                BlocConsumer<RegisterCubit, RegisterCubitState>(
                  listener: (context, state) {
                      if(state is RegisterCubitError){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${state.err}"), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
                    }
                    if(state is RegisterCubitSuccess){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Successfully regsitered"), backgroundColor: theme.colorScheme.secondary, behavior: SnackBarBehavior.floating));
                      context.router.push(LoginRoute());
                    }
                  },
                  builder: (context, state) {

                    
                    return CustomButton(
                      text: "SIGN UPs",
                      width: width,
                      height: height,
                      mainHorizontalPadding: mainHorizontalPadding,
                      theme: theme,
                       shouldAnimated: (state is RegisterCubitLoading) ? true: false,
                      onTap: () => context.read<RegisterCubit>().register(
                          username: username.text,
                          email: email.text,
                          password: password.text,
                          confirmPassword: confirmPassword.text),
                    );
                  },
                ),

                SizedBox(
                  height: width * .01,
                ),
                const Spacer(),
                dontHaveAccount(context, width, theme),
                const Spacer(),
                //
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
            text: "Already have an account? ",
            style: theme.textTheme.labelLarge),
        TextSpan(
            text: "Sign in",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                log("working");
                context.router.push(LoginRoute());
              },
            style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.w900)),
      ])),
    );
  }
}
