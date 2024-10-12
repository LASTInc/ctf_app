part of 'login_rep_bloc.dart';

@immutable
sealed class LoginRepState {}

class LoginRepInitial extends LoginRepState {
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();
  String loginStr = "";
  String passwordStr = "";


  LoginRepInitial copyWith(String? newLogin, String? newPassword) {
    LoginRepInitial newData = LoginRepInitial();
    newData.login.text = newLogin ?? loginStr;
    newData.password.text = newPassword ?? passwordStr;
    newData.loginStr = newLogin ?? loginStr;
    newData.passwordStr = newLogin ?? passwordStr;
    return newData;
  }
}
