
import 'package:auto_route/auto_route.dart';
import 'package:twitter_clone/presentation/pages/auth/register.dart';

import '../../pages/auth/login.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route",
  routes: [
    CustomRoute(initial: true,page: LoginPage, durationInMilliseconds: 400, transitionsBuilder: TransitionsBuilders.slideRight),
    CustomRoute(page: RegisterPage, durationInMilliseconds: 400, transitionsBuilder: TransitionsBuilders.slideLeft),

    // MaterialRou
  ]
)
class $AppRouter {}