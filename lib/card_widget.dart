
import 'package:flutter/material.dart';

class ColorCardWidget extends StatefulWidget {
  final Function(Color color) onChanged;
  const ColorCardWidget({Key key,this.onChanged}) : super(key: key);

  @override
  _ColorCardWidgetState createState() => _ColorCardWidgetState();
}

class _ColorCardWidgetState extends State<ColorCardWidget> {
  Color color ;
  @override
  Widget build(BuildContext context) {
    return Card(
            color: color,
            child: ListTile(
              trailing: DropdownButton<Color>(
                items: [
                  DropdownMenuItem(
                    value: Colors.red,
                    child: Text("red"),
                  ),
                  DropdownMenuItem(
                    value: Colors.green,
                    child: Text("green"),
                  ),
                  DropdownMenuItem(
                    value: Colors.pink,
                    child: Text("pink"),
                  )
                ],
                onChanged: (color){
                    setState(() {
                      this.color = color;
                    });
                    widget.onChanged(color);
                },
              ),
              title: Text("Color changes"),
              subtitle: Text("color"),
            ),
          );
  }
}