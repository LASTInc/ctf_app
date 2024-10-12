import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/main_screen_bloc.dart';
import 'users_messages_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //final myBloc = MainScreenBloc();

  @override
  void initState() {
    super.initState();
    //myBloc.add(GetAllTwits());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          if (state is AllPosts) {
            return Scaffold(
                body: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.sizeOf(context).width * 0.04),
                    child: Expanded(
                        child: ListView.builder(
                            itemCount: (state as AllPosts).allTwits.length + 1,
                            itemBuilder: (context, index) {
                              return getItem(index, state);
                            }))));
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  Widget getItem(int index, AllPosts state ) {
    if (index == 0) {
      return SafeArea(child: Padding(
        padding: EdgeInsets.only(left: 10, top: 10),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue.shade100,
            onPressed: () {
              Navigator.pushNamed(context, '/nav');
            },
            child: Icon(Icons.menu),
            ),
          const Text(
        "Feeds",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      )
        ],
      ),
      )
      );
    } else {
      return UsersMess(
        name: state.allTwits[index-1].name,
        someText: state.allTwits[index-1].someText,
        image:state.allTwits[index - 1].image,
      );
    }
  }
}
