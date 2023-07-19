



import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:twitter_clone/presentation/core/routes/router.gr.dart';

import '../common/bottom_nav/bottom_nav_bar.dart';
import '../tweet/tweet.dart';




class GuestMainPage extends StatelessWidget {
  const GuestMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: AutoRouter(
        placeholder: (context) {
          return const Scaffold(
            backgroundColor: Color(0xff000000),
          );
        },
      ),
    );
  }
}



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  TabsRouter? tabsRouter;
  @override
  Widget build(BuildContext context) {
     return AutoTabsRouter(
      homeIndex: 0,
      routes: const [
       GuestMainRoute(),
       SearchRoute()
      ],
      builder: (context, child, anim) {
          tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: 
          LampBottomNavigationBar(
     items: const  [
          Icons.home_outlined,
          Icons.search
        ],
        width: double.infinity,  
        onTap:(index){
          tabsRouter!.setActiveIndex(index);              
        },
        currentIndex: tabsRouter!.activeIndex,          
          ),
          body:  child
        );
      },
    );
  
  }
}