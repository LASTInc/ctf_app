import 'package:flutter/material.dart';
import '../bloc/nav_bar_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ctf_ver_1/main_screen/views/main_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  //NavBarBloc myBloc = NavBarBloc();

  @override
  void initState() {
    super.initState();
    //myBloc.add(NavBarEvent());
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.sizeOf(context).height * 0.15;
    return BlocBuilder<NavBarBloc, NavBarState>(
        
        builder: (context, state) {
          return Scaffold(
            body: ListView.builder(
                itemCount: (state as NavBarInitial).allButtons.length + 1,
                itemBuilder: (context, index) {
                  return getWidget(size, index, state);
                }),
          );
        });
  }

  Widget getWidget(double size, int index, dynamic state) {
    if (index == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
              child: Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: FloatingActionButton(
              backgroundColor: Colors.blue.shade100,
              onPressed: () {
                dynamic callBack = (state as NavBarInitial).selectedButton.onPresssed;
                if (callBack != null) {
                  callBack(context);
                }
              },
              child: Icon(Icons.close),
            ),
          )),
          SizedBox(
            height: size*0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(290.0),
                    
                    child: Image.network(
                      width: 200,
                      height: 200,
                          "https://avatars.mds.yandex.net/get-entity_search/1554108/979273824/S600xU_2x"),
                  ),
                  Text(
                    "Markov Lavrentiy",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("@lavr",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(
            height: size*0.1,
          ),
                ],
              )
            ],
          )
        ],
      );
    } else {
      index--;
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NavBarButton(
                onPressed: () {
                  BlocProvider.of<NavBarBloc>(context).add(SelectedButton(selectedButtonIndex: index, context: context));
                  
                },
                data: (state as NavBarInitial).allButtons[index].name,
                myIcon: (state as NavBarInitial).allButtons[index].icon,
                isSelected:
                    (state as NavBarInitial).selectedButtonIndex == index,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      );
    }
  }
}

@immutable
class NavBarButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isSelected;
  final IconData myIcon;
  final String data;
  const NavBarButton(
      {required this.isSelected,
      required this.data,
      required this.myIcon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return getButton(context);
  }

  Widget getButton(BuildContext context) {
    if (isSelected) {
      return FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.black)),
        child: Padding(
          padding: EdgeInsets.only(left: 5, top: 10, bottom: 10, right: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                size: MediaQuery.sizeOf(context).width * 0.08,
                myIcon,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "$data",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                genText(9 - data.length),
                style: TextStyle(fontSize: 20, color: Colors.black),
              )
            ],
          ),
        ),
      );
    } else {
      return FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.white)),
        child: Padding(
          padding: EdgeInsets.only(left: 5, top: 10, bottom: 10, right: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                size: MediaQuery.sizeOf(context).width * 0.08,
                myIcon,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "$data",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                genText(9 - data.length),
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ),
      );
    }
  }

  String genText(int size) {
    if (size <= 0) return "";
    String newData = "";
    for (int index = 0; index != size; index++) newData += "a";
    return newData;
  }
}
