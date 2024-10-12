import 'package:flutter/material.dart';




class UsersMess extends StatefulWidget {
  UsersMess({
    super.key,
    this.image = "https://avatars.mds.yandex.net/get-entity_search/1554108/979273824/S600xU_2x",
    this.someText = "Добрый день всем. Я новый президент США. Моя новая цель: Победа России в СВО и остановка украинсокй власти",
    this.name = "Donald Trump",
    });

  String name;
  int? test;
  String image;
  String someText;
  List<String>? someImages;

  @override
  State<UsersMess> createState() => _UsersMessState(
    name: name,
    image:image,
    someText: someText
  );
}


class _UsersMessState extends State<UsersMess> {

  final String name;
  int? test;
  final String image;
  final String someText;
  List<String>? someImages;

  _UsersMessState({
    required this.image,
    required this.someText,
    required this.name,
    });


    @override
    void initState() {
      super.initState();
    
    }


  double? newSize;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: ConstrainedBox(
      
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width*0.9,
      ),
      child: _someCardView(),
      
    ),);
  }


  Widget _someCardView() {
return Card(
      color: genColor(),
      child: LayoutBuilder(builder: (context, constraints) {
        debugPrint(constraints.maxHeight.toString());
        changeSize(constraints.maxHeight);
        return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _head(context),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
            Text(someText, style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),)
          ],

      ),
      );
      },),
    );
  }


  Color genColor() {
    List<Color> someColors = [Colors.blue.shade200, Colors.yellow.shade200, Colors.red.shade200];
    return someColors[someText.length % 3];
  }


  Widget forUpdate() {
    return Text(test != null ? test!.toString() : "0", style: TextStyle(fontSize: 10),);
  }


  Widget _head(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: SizedBox.fromSize(
            size: Size.fromRadius(20),
            child:  Image.network(
              image,
              ),
          ),
        ),
        SizedBox(width: MediaQuery.sizeOf(context).height*0.01,),
        Text(
          name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
      ],
    );
  }

  void changeSize(double sizeData) {
    if (newSize != sizeData) newSize = sizeData;
  }
  double get myMinHeightKof {
    if (someImages == null) {
      return 0.2;
    }
    return 0.5;
  }
}