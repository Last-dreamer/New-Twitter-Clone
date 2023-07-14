import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/presentation/core/routes/router.gr.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/login_cubit_cubit.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/should_show_bg_color.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/show_password.dart';
import 'package:twitter_clone/theme.dart';

import 'di.dart' as di;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp( MyApp());
} 

class MyApp extends StatelessWidget {
    MyApp({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      builder: (context, child){
        
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_)=> ShowPasswordCubit()),
            BlocProvider(create: (_)=> ShouldShowBdColor()),
            BlocProvider(create: (_)=> LoginCubit())
          ],
          child:  child!
        );
      },
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}



