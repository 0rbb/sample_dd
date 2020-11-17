import 'package:flutter/material.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.deepOrangeAccent),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Color _baseColor = Theme.of(context).accentColor;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: Container(
            decoration: _decoration(_baseColor, color: Colors.amber),
            child: _buildFunnelContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildFunnelContent() => Container(
        width: 170.0,
        height: 190,
        child: DragAndDropLists(
          disableScrolling: true,
          dragHandle: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.drag_handle),
              )),
          children: [
            DragAndDropList(
              header: Center(
                child: Text(
                  'list',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              children: [
                _buildItems(context, 'Uno item'),
                _buildItems(context, 'Duo item')
              ],
            )
          ],
          axis: Axis.horizontal,
          listWidth: 160,
          listPadding: EdgeInsets.all(8.0),
        ),
      );
}

DragAndDropItem _buildItems(BuildContext context, String state) {
  Color color = Colors.orange.withOpacity(.5);
  return DragAndDropItem(
      child: Padding(
    padding: const EdgeInsets.all(2.0),
    child: Padding(
      padding: const EdgeInsets.only(left: 6.0, top: 6.0),
      child: Container(
        decoration: _decoration(color, color: color),
        height: 60,
        width: 158,
        child: FlatButton(
            child: Text(
              state,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  height: 1.5, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onPressed: () => print('press')),
      ),
    ),
  ));
}

BoxDecoration _decoration(Color baseColor,
    {Color color, BorderRadius borderRadius}) {
  return BoxDecoration(
    border: Border.all(
        color: baseColor, //Colors.green,
        width: 3.0,
        style: BorderStyle.solid),
    color: color,
    borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(7.0)),
  );
}
