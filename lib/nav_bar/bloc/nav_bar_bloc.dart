import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  NavBarInitial _someState = NavBarInitial();
  NavBarBloc() : super(NavBarInitial()) {
    on<NavBarEvent>((event, emit) {
      emit(_someState.copyWith(newIndex: 0));
    });


    on<SelectedButton>((event, emit) {
      _someState = _someState.copyWith(newIndex: event.selectedButtonIndex);
      emit(_someState);
      dynamic callBack = _someState.selectedButton.onPresssed;
      if (callBack != null) {
        callBack(event.context);
      }
    },);
  }
}
