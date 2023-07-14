
import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/should_show_bg_color.dart';

import 'package:twitter_clone/presentation/pages/auth/widgets/custom_button.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/custom_textfield.dart';
import 'package:auto_route/auto_route.dart';
import 'package:twitter_clone/theme.dart';

import '../../core/routes/router.gr.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  var mainHorizontalPadding = .07;

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
            padding: EdgeInsets.symmetric(horizontal: width * mainHorizontalPadding, vertical: width * mainHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                    onTap: () => context.router.removeLast(),
                    child: Icon(Icons.arrow_back, color: AppTheme.darkTheme.secondaryHeaderColor)),
                SizedBox(height: width * .07,),
                Hero(
                  tag: 'background_color',
                  child: Container(
                    height: 10.0, // Adjust the size according to your text field size
                    color: Colors.transparent,
                  ),
                ),

                Text("Create Account", style: theme.textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w700, fontSize: 30)),
                SizedBox(height: width * .01,),
                Text("Please fill the  input below here", style: theme.textTheme.bodyMedium),
                SizedBox(height: width * .04),

                // ! ****** start textfield from here .....

              // Container(
              //   // color: Colors.red,
              //   height: height/2,
              //   child: Column(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       CustomTextField(
              //         key: ValueKey(1),
              //         hintText: "User Name", iconData: Icons.person_2, width: width, theme: theme,
              //         showBackgroundColor: context.watch<ShouldShowBdColor>().state == 1,
              //         onTap: () => context.read<ShouldShowBdColor>().changeBackgroundColor(1),
              //       ),
              //       SizedBox(height: width * .05,),
              //       CustomTextField(
              //         key:const  ValueKey(2),
              //         hintText: "Email", iconData: Icons.email, width: width, theme: theme,
              //         showBackgroundColor: context.watch<ShouldShowBdColor>().state == 2,
              //         onTap: () => context.read<ShouldShowBdColor>().changeBackgroundColor(2),
              //       ),

              //       SizedBox(height: width * .05,),
              //       CustomTextField(
              //         key: const  ValueKey(3),
              //         hintText: "Password", iconData: Icons.lock_open, width: width, theme: theme,
              //         showBackgroundColor: context.watch<ShouldShowBdColor>().state == 3,
              //         obscure: true,
              //         onTap: () => context.read<ShouldShowBdColor>().changeBackgroundColor(3),
              //       ),
              //       SizedBox(height: width * .05,),

              //       CustomTextField(
              //         key: const ValueKey(4),
              //         hintText: "Confirm Password", iconData: Icons.lock, width: width, theme: theme,
              //         showBackgroundColor: context.watch<ShouldShowBdColor>().state == 4,
              //         obscure: true,
              //         onTap: () => context.read<ShouldShowBdColor>().changeBackgroundColor(4),
              //       ),
              //       SizedBox(height: width * .1,),
              //     ],
              //   ),
              // ),


                CustomButton(text: "SIGN UP", width: width, mainHorizontalPadding: mainHorizontalPadding, theme: theme),
                SizedBox(height: width * .02,),
                const  Spacer(),
                dontHaveAccount(context,width, theme),
                const Spacer(),
            //
              ],
            ),

          ),
        ),
      ),
    );
  }

  Container dontHaveAccount(BuildContext context, double width, ThemeData theme) {
    return Container(
      width: width,
      alignment: Alignment.center,
      child: RichText(text: TextSpan(
          children: [
            TextSpan(text:"Already have an account? ", style: theme.textTheme.labelLarge),
            TextSpan(text:"Sign in",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    log("working");
                    context.router.push(LoginRoute());
                  },
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.secondary, fontWeight: FontWeight.w900)),
          ]
      )
      ),
    );
  }
}

