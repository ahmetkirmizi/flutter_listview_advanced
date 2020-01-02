import 'package:flutter/material.dart';
import 'package:listview_advanced/card_widget.dart';
import 'package:http/http.dart' as http;

class AdvanceStateView extends StatefulWidget {
  @override
  _AdvanceStateViewState createState() => _AdvanceStateViewState();
}

class ColorBase {
  Color color;
  ColorBase({this.color});
}

class _AdvanceStateViewState extends State<AdvanceStateView> {
  int selectedIndex = 0;
  Color selectedColor = Colors.white24;
  List<ColorBase> colors = [];

  Future getApi() async {
    return (await http.get("https://jsonplaceholder.typicode.com/posts")).body;
  }

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 15; i++) {
      colors.add(ColorBase(color: Colors.white24));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getApi(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) {
              return listviewBody;
            } else {
              return Center(child: Text("data not found"));
            }
            break;
          default:
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    ));
  }

  Widget get listviewBody => ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return ColorCardWidget(
            onChanged: (color) {
              colors[index].color = color;
            },
          );
        },
      );
}
