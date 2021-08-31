import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Workers On Site'),),
      body: Column(
        children: [
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*.25),
              color: Colors.lime,
              child: TextButton(
                child: Text('Convert Workers Data(.csv)'),
                onPressed: (){},
              ),
            ),
          Spacer(),
        ],
      ),
    );
  }
}
