import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ctf_ver_1/NetRep/my_net.dart';

part 'login_rep_event.dart';
part 'login_rep_state.dart';

class LoginRepBloc extends Bloc<LoginRepEvent, LoginRepState> {

  LoginRepInitial state = LoginRepInitial();
  LoginRepBloc() : super(LoginRepInitial()) {
    on<LoginRepEvent>((event, emit) {
    });

    on<CheckUser>(checkUserFunc);

    on<NewLogin>(newLogin);

    on<NewPassword>(newPassword);
  }



  void checkUserFunc(CheckUser event, Emitter<LoginRepState> emit) async  {
      final ans = await compute(MyNetworking().checkUser, {"login":state.loginStr, "password":state.passwordStr});
      if (ans) {
        event.callBack(event.context);
      } 
  }

  void newLogin(NewLogin event, Emitter<LoginRepState> emit) {
    LoginRepInitial newState = state.copyWith(event.login, null);
    state = newState.copyWith(null, null);
    emit(newState); 
  }

  void newPassword(NewPassword event, Emitter<LoginRepState> emit) {
    LoginRepInitial newState = state.copyWith(null, event.newLogin);
    state = newState.copyWith(null, null);
    emit(newState);
  }

}
