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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../../data/model/twitter.dart' as _i10;
import '../../pages/add_or_reply_tweet.dart/add_reply_tweet.dart' as _i4;
import '../../pages/auth/login.dart' as _i2;
import '../../pages/auth/register.dart' as _i3;
import '../../pages/main_page/main_page.dart' as _i1;
import '../../pages/profle/profile.dart' as _i5;
import '../../pages/reply_tweets/reply_tweet.dart' as _i7;
import '../../pages/tweet/tweet.dart' as _i6;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
        transitionsBuilder: _i8.TransitionsBuilders.slideRight,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.RegisterPage(key: args.key),
        transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GuestMainRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.GuestMainPage(),
      );
    },
    AddReplyTweetRoute.name: (routeData) {
      final args = routeData.argsAs<AddReplyTweetRouteArgs>();
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.AddReplyTweetPage(
          key: args.key,
          text: args.text,
        ),
        transitionsBuilder: _i8.TransitionsBuilders.noTransition,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfilePage(),
        transitionsBuilder: _i8.TransitionsBuilders.zoomIn,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TweetsRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.TweetsPage(),
        transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ReplyTweetRoute.name: (routeData) {
      final args = routeData.argsAs<ReplyTweetRouteArgs>();
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.ReplyTweetPage(
          key: args.key,
          tweet: args.tweet,
        ),
        transitionsBuilder: _i8.TransitionsBuilders.zoomIn,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          MainRoute.name,
          path: '/main-page',
          children: [
            _i8.RouteConfig(
              GuestMainRoute.name,
              path: 'guest-main-page',
              parent: MainRoute.name,
              children: [
                _i8.RouteConfig(
                  TweetsRoute.name,
                  path: '',
                  parent: GuestMainRoute.name,
                ),
                _i8.RouteConfig(
                  ReplyTweetRoute.name,
                  path: 'reply-tweet-page',
                  parent: GuestMainRoute.name,
                ),
              ],
            ),
            _i8.RouteConfig(
              AddReplyTweetRoute.name,
              path: 'add-reply-tweet-page',
              parent: MainRoute.name,
            ),
            _i8.RouteConfig(
              ProfileRoute.name,
              path: 'profile-page',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i8.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          RegisterRoute.name,
          path: '/register-page',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main-page',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i8.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i9.Key? key})
      : super(
          RegisterRoute.name,
          path: '/register-page',
          args: RegisterRouteArgs(key: key),
        );

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.GuestMainPage]
class GuestMainRoute extends _i8.PageRouteInfo<void> {
  const GuestMainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          GuestMainRoute.name,
          path: 'guest-main-page',
          initialChildren: children,
        );

  static const String name = 'GuestMainRoute';
}

/// generated route for
/// [_i4.AddReplyTweetPage]
class AddReplyTweetRoute extends _i8.PageRouteInfo<AddReplyTweetRouteArgs> {
  AddReplyTweetRoute({
    _i9.Key? key,
    required String text,
  }) : super(
          AddReplyTweetRoute.name,
          path: 'add-reply-tweet-page',
          args: AddReplyTweetRouteArgs(
            key: key,
            text: text,
          ),
        );

  static const String name = 'AddReplyTweetRoute';
}

class AddReplyTweetRouteArgs {
  const AddReplyTweetRouteArgs({
    this.key,
    required this.text,
  });

  final _i9.Key? key;

  final String text;

  @override
  String toString() {
    return 'AddReplyTweetRouteArgs{key: $key, text: $text}';
  }
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i6.TweetsPage]
class TweetsRoute extends _i8.PageRouteInfo<void> {
  const TweetsRoute()
      : super(
          TweetsRoute.name,
          path: '',
        );

  static const String name = 'TweetsRoute';
}

/// generated route for
/// [_i7.ReplyTweetPage]
class ReplyTweetRoute extends _i8.PageRouteInfo<ReplyTweetRouteArgs> {
  ReplyTweetRoute({
    _i9.Key? key,
    required _i10.TweetModel tweet,
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

  final _i9.Key? key;

  final _i10.TweetModel tweet;

  @override
  String toString() {
    return 'ReplyTweetRouteArgs{key: $key, tweet: $tweet}';
  }
}
