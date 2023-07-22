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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../../data/model/twitter.dart' as _i9;
import '../../pages/auth/login.dart' as _i2;
import '../../pages/auth/register.dart' as _i3;
import '../../pages/main_page/main_page.dart' as _i1;
import '../../pages/reply_tweets/reply_tweet.dart' as _i6;
import '../../pages/profle/profile.dart' as _i4;
import '../../pages/tweet/tweet.dart' as _i5;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideRight,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.RegisterPage(key: args.key),
        transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GuestMainRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.GuestMainPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.ProfilePage(),
        transitionsBuilder: _i7.TransitionsBuilders.zoomIn,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TweetsRoute.name: (routeData) {
      final args = routeData.argsAs<TweetsRouteArgs>(
          orElse: () => const TweetsRouteArgs());
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.TweetsPage(key: args.key),
        transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ReplyTweetRoute.name: (routeData) {
      final args = routeData.argsAs<ReplyTweetRouteArgs>();
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.ReplyTweetPage(
          key: args.key,
          tweet: args.tweet,
        ),
        transitionsBuilder: _i7.TransitionsBuilders.zoomIn,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          MainRoute.name,
          path: '/main-page',
          children: [
            _i7.RouteConfig(
              GuestMainRoute.name,
              path: 'guest-main-page',
              parent: MainRoute.name,
              children: [
                _i7.RouteConfig(
                  TweetsRoute.name,
                  path: '',
                  parent: GuestMainRoute.name,
                ),
                _i7.RouteConfig(
                  ReplyTweetRoute.name,
                  path: 'reply-tweet-page',
                  parent: GuestMainRoute.name,
                ),
              ],
            ),
            _i7.RouteConfig(
              ProfileRoute.name,
              path: 'profile-page',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i7.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          RegisterRoute.name,
          path: '/register-page',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main-page',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i7.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i8.Key? key})
      : super(
          RegisterRoute.name,
          path: '/register-page',
          args: RegisterRouteArgs(key: key),
        );

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.GuestMainPage]
class GuestMainRoute extends _i7.PageRouteInfo<void> {
  const GuestMainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          GuestMainRoute.name,
          path: 'guest-main-page',
          initialChildren: children,
        );

  static const String name = 'GuestMainRoute';
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.TweetsPage]
class TweetsRoute extends _i7.PageRouteInfo<TweetsRouteArgs> {
  TweetsRoute({_i8.Key? key})
      : super(
          TweetsRoute.name,
          path: '',
          args: TweetsRouteArgs(key: key),
        );

  static const String name = 'TweetsRoute';
}

class TweetsRouteArgs {
  const TweetsRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'TweetsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ReplyTweetPage]
class ReplyTweetRoute extends _i7.PageRouteInfo<ReplyTweetRouteArgs> {
  ReplyTweetRoute({
    _i8.Key? key,
    required _i9.TweetModel tweet,
  }) : super(
          ReplyTweetRoute.name,
          path: 'reply-tweet-page',
          args: ReplyTweetRouteArgs(
            key: key,
            tweet: tweet,
          ),
        );

  static const String name = 'ReplyTweetRoute';
}

class ReplyTweetRouteArgs {
  const ReplyTweetRouteArgs({
    this.key,
    required this.tweet,
  });

  final _i8.Key? key;

  final _i9.TweetModel tweet;

  @override
  String toString() {
    return 'ReplyTweetRouteArgs{key: $key, tweet: $tweet}';
  }
}
