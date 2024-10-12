part of 'nav_bar_bloc.dart';

@immutable
sealed class NavBarState {}

final class NavBarInitial extends NavBarState {
  List<ButtonModel> allButtons = [
    ButtonModel(
      name: "New Feeds",
      icon: Icons.feed,
      onPresssed: (context) {
        Navigator.pushNamed(context, '/start');
      },
      ),
    ButtonModel(name: "Messages", icon: Icons.message),
    ButtonModel(name: "Settings", icon: Icons.settings),
    ButtonModel(name: "Datas", icon: Icons.data_array),
    ButtonModel(name: "Media", icon: Icons.folder)
    ];
    int selectedButtonIndex = 0;

  NavBarInitial copyWith({int? newIndex}) {
    NavBarInitial newData = NavBarInitial();
    newData.selectedButtonIndex = newIndex ?? selectedButtonIndex;
    return newData;
  }


  ButtonModel get selectedButton {
    return allButtons[selectedButtonIndex];
  }
}


final class ButtonModel {
  final String name;
  final IconData icon;
  void Function(BuildContext context)? onPresssed;
  ButtonModel({
    required this.name,
    required this.icon,
    this.onPresssed
    });
}
