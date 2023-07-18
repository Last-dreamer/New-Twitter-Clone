
import 'package:auto_route/auto_route.dart'; 
import 'package:twitter_clone/presentation/pages/auth/register.dart';
import 'package:twitter_clone/presentation/pages/reply_tweets/reply_tweet.dart';
import 'package:twitter_clone/presentation/pages/tweet/tweet.dart';

import '../../pages/auth/login.dart';
import '../../pages/main_page/main_page.dart';
import '../../pages/search/search.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route",
  routes: [
     CustomRoute(
      page: MainPage,
     children: [
       AutoRoute( 
         page: GuestMainPage,
         children: [
          CustomRoute(
            initial: true,
             page: TweetsPage, 
             durationInMilliseconds: 300, 
          transitionsBuilder: TransitionsBuilders.fadeIn
         ),
        CustomRoute(page: ReplyTweetPage,
          durationInMilliseconds: 300, 
          transitionsBuilder: TransitionsBuilders.zoomIn
         ),


         ]      
      ),

      CustomRoute(page: SearchPage,
          durationInMilliseconds: 300, 
          transitionsBuilder: TransitionsBuilders.zoomIn
         ),
      
    ]
     ),
    CustomRoute(
      initial: true,
      page: LoginPage, durationInMilliseconds: 400, transitionsBuilder:
       TransitionsBuilders.slideRight
       ),
    CustomRoute(page: RegisterPage, 
    durationInMilliseconds: 400, transitionsBuilder: TransitionsBuilders.slideLeft),

  
  ]
)
class $AppRouter {}









////
///
///
//
// import 'package:auto_route/auto_route.dart'; 
// import 'package:twitter_clone/presentation/pages/auth/register.dart';
// import 'package:twitter_clone/presentation/pages/reply_tweets/reply_tweet.dart';
// import 'package:twitter_clone/presentation/pages/tweet/tweet.dart';

// import '../../pages/auth/login.dart';
// import '../../pages/main_page/main_page.dart';

// @MaterialAutoRouter(
//   replaceInRouteName: "Page,Route",
//   routes: [

  
//      CustomRoute(
//       page: MainPage,
//       initial: true,     
//      children: [
//        AutoRoute( 
//          page: GuestMainPage,
//          children: [
//           CustomRoute(
//             initial: true,
//              page: TweetsPage, 
//         //      durationInMilliseconds: 300, 
//         //  transitionsBuilder: TransitionsBuilders.fadeIn
//          ),
//         CustomRoute(page: ReplyTweetPage,
//           durationInMilliseconds: 300, 
//           transitionsBuilder: TransitionsBuilders.fadeIn
//          ),
//          ]      
//       ),
      
//     ]
//      ),
//     CustomRoute(
//       // initial: true,
//       page: LoginPage, durationInMilliseconds: 400, transitionsBuilder:
//        TransitionsBuilders.slideRight
//        ),

//     CustomRoute(page: RegisterPage, 
//     durationInMilliseconds: 400, transitionsBuilder: TransitionsBuilders.slideLeft),

   
      
//     // MaterialRou
//   ]
// )
// class $AppRouter {}
///
///
///