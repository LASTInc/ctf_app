part of 'main_screen_bloc.dart';

@immutable
sealed class MainScreenState {}

final class MainScreenInitial extends MainScreenState {}


class AllPosts extends MainScreenState {
  List<TwitModel> allTwits = [];
}