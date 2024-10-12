part of 'main_screen_bloc.dart';

@immutable
sealed class MainScreenEvent {}

class GetAllTwits extends MainScreenEvent {

}


class GetAllTwitsforUser extends MainScreenBloc {
  final String login;
  final String password;
  GetAllTwitsforUser({required this.login, required this.password});
}
