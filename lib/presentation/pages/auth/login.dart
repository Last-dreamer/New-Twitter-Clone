import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:twitter_clone/presentation/core/routes/router.gr.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/should_show_bg_color.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/custom_textfield.dart';
import 'package:auto_route/auto_route.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/login_button.dart';

import '../../../data/model/twitter.dart';
import '../../../di.dart';
import '../../core/pref/pref.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var mainHorizontalPadding = .07;

  var backgroundColor = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void initState() {
    _checkIfAlreadyLogin();
    super.initState();
  }

  _checkIfAlreadyLogin() async {
    User? user = await Pref.getUser();
    if (user != null) {
      // ignore: use_build_context_synchronously
      context.router.replace(const MainRoute());
    }
  }

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
                  tag: widget.key.toString(),
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
                LoginButton(
                    theme: theme,
                    email: email,
                    password: password,
                    width: width,
                    height: height,
                    mainHorizontalPadding: mainHorizontalPadding),
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
                context.router.push(RegisterRoute());
              },
            style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.w900)),
      ])),
    );
  }
}
