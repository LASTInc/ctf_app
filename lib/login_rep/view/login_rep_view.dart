import 'package:ctf_ver_1/login_rep/bloc/login_rep_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ctf_ver_1/nav_bar/view/nav_bar_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ctf_ver_1/main_screen/bloc/main_screen_bloc.dart';

import 'dart:ui';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //LoginRepBloc myBloc = LoginRepBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginRepBloc, LoginRepState>(
        builder: (context, state) {
          return Scaffold(
            body: getBlur(context, someData(context, state as LoginRepInitial), state as LoginRepInitial)
          );
        });
  }

  Widget getBlur(
    BuildContext conext,
    Widget child,
    LoginRepInitial state,
    ) {
    return  Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.grey.shade300.withOpacity(0.5),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          ),
        ),
         
        
        child
      ],
    );
  }

  Widget someData(BuildContext context, LoginRepInitial state) {
    double leftData = MediaQuery.sizeOf(context).width*0.01;
    double topData = MediaQuery.sizeOf(context).height*0.2;

    return Padding(
      padding: EdgeInsets.only(left: leftData, top: topData),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Добро пожаловать", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const Column( 
            children: [
              Text("Введите свои учетные", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
              Text("данные", style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal))
            ],
          ),
          SizedBox(height: leftData*8,),
          myTextField(context, "Login", state.login, (value) {
            BlocProvider.of<LoginRepBloc>(context).add(NewLogin(login: value));
          }),
          SizedBox(height: leftData*4,),
          myTextField(context, "password", state.password, (value) {
            BlocProvider.of<LoginRepBloc>(context).add(NewPassword(newLogin: value));
          }),
          SizedBox(height: leftData*8,),
          signButton(context)
        ],
      ),
    );
  }


  Widget myTextField(
    BuildContext context,
    String placeHolder,
    TextEditingController controller,
    void Function(String data) change 
    ) {
    double width = MediaQuery.sizeOf(context).width*0.9;

    return SizedBox(
      width: width,
      child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text(placeHolder),
            fillColor: Colors.white,
            filled: true
          ),
          onChanged: change,
        ),
      
    );
  }


  Widget signButton(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width*0.9;
    return SizedBox(
      width: width,
      child: OutlinedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((dynamic state) => Colors.red)),
        child: Padding(
          padding: EdgeInsets.only(top: width*0.03, bottom: width*0.03),
          child: Text("Sign In", style: TextStyle(fontSize: 20, color: Colors.white),),
        ),
        onPressed: () {
          BlocProvider.of<LoginRepBloc>(context).add(CheckUser(context: context, callBack: (newContext) {
            BlocProvider.of<MainScreenBloc>(context).add(GetAllTwits());
            Navigator.pushNamed(context, '/nav');
          }));
        },
        ),
    );
  }

// https://www.rosatom.ru/upload/iblock/0bb/0bbb076e4e7427065f2c0f4727cf1a22.png

  
}
