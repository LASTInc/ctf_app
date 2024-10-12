part of 'nav_bar_bloc.dart';

//@immutable
//sealed class NavBarEvent {}

class NavBarEvent {}



class SelectedButton extends NavBarEvent {
  final int selectedButtonIndex;
  BuildContext context;
  SelectedButton({required this.selectedButtonIndex, required this.context});
}