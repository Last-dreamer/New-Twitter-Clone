// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/material.dart' as _i4;

import '../../pages/auth/login.dart' as _i1;
import '../../pages/auth/register.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.LoginPage(key: args.key),
        transitionsBuilder: _i3.TransitionsBuilders.slideRight,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.RegisterPage(key: args.key),
        transitionsBuilder: _i3.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          RegisterRoute.name,
          path: '/register-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i3.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i5.Key? key})
      : super(
          LoginRoute.name,
          path: '/',
          args: LoginRouteArgs(key: key),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i3.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i5.Key? key})
      : super(
          RegisterRoute.name,
          path: '/register-page',
          args: RegisterRouteArgs(key: key),
        );

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}
