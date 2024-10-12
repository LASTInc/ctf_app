import 'package:ctf_ver_1/main_screen/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:ctf_ver_1/login_rep/view/login_rep_view.dart';
import 'package:ctf_ver_1/main_screen/views/users_messages_view.dart';
import 'package:ctf_ver_1/nav_bar/view/nav_bar_view.dart';
import 'package:ctf_ver_1/nav_bar/view/nav_bar_view.dart';
import 'package:ctf_ver_1/main_screen/views/main_screen.dart';
import 'package:ctf_ver_1/nav_bar/view/nav_bar_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_rep/bloc/login_rep_bloc.dart';
import 'main_screen/bloc/main_screen_bloc.dart';
import 'nav_bar/bloc/nav_bar_bloc.dart';

void main() {
  MainScreenBloc _mainScreenBloc = MainScreenBloc();
  NavBarBloc _navBarBloc = NavBarBloc();
  LoginRepBloc _loginBloc = LoginRepBloc();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<MainScreenBloc>(create: (BuildContext context) {
        return _mainScreenBloc;
      },
      ),
      BlocProvider<NavBarBloc>(create: (BuildContext context) {
        return _navBarBloc;
      },
      ),
      BlocProvider<LoginRepBloc>(create: (BuildContext context) {
        return _loginBloc;
      },
      ),
    ], child: const MyApp())
    
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      routes: {
        '/start': (context) => MainScreen(),
        '/nav': (context) => NavBar() 
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}

