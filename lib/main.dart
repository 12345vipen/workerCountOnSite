import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workers On Site',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>> _data = [];

  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/worker.csv");
    List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kindacode.com"),
      ),
      body: _data.length == 0
          ? Column(
              children: [
                Spacer(),
                Center(child: Text('Click on the file button to load latest workers data',style: TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.bold),)),
                IconButton(onPressed: (){}, icon: Icon(Icons.file_copy_outlined,size: 40,)),
                Spacer(),
              ],
            )
          : ListView.builder(
              itemCount: _data.length,
              itemBuilder: (_, index) {
                return Card(
                  margin: const EdgeInsets.all(3),
                  color: index == 0 ? Colors.amber : Colors.white,
                  child: ListTile(
                    leading: Text(_data[index][0].toString()),
                    title: Text(_data[index][1]),
                    trailing: Text(_data[index][2].toString()),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.contact_page_outlined), onPressed: _loadCSV),
    );
  }
}
