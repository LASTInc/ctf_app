part of 'login_rep_bloc.dart';


/*
@immutable
sealed class LoginRepEvent {}
*/


class LoginRepEvent {

}

class CheckUser extends LoginRepEvent {
  BuildContext context;
  void Function(BuildContext context) callBack;
  CheckUser({
      required this.context,
      required this.callBack
      });
}

class NewLogin extends LoginRepEvent {
  String login;
  NewLogin({required this.login});
}


class NewPassword extends LoginRepEvent {
  String newLogin;
  NewPassword({required this.newLogin});
}
