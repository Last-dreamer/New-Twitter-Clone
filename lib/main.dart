import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/domain/use_cases/twitter_usecase.dart';
import 'package:twitter_clone/presentation/core/routes/router.gr.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/login_cubit_cubit.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/register_cubit_cubit.dart'; 
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/should_show_bg_color.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/show_password.dart';
import 'package:twitter_clone/presentation/pages/tweet/widget/cubit/tweets_cubit_cubit.dart';
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
            BlocProvider<LoginCubit>(create: (context) => LoginCubit(useCase: di.di<TwitterUseCase>())),
            BlocProvider<RegisterCubit>(create: (context) => RegisterCubit(useCase: di.di<TwitterUseCase>())),
            BlocProvider<TweetsCubit>(create: (context) => TweetsCubit(useCase: di.di<TwitterUseCase>()))


          ],
          child:  child!
        );
      },
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}



