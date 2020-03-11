import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'Todo';

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: appName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [];
  final textController = TextEditingController();

  _showDialog() {
    showDialog(
      context: context,
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: textController,
                onSubmitted: (String text) {
                  items.add(text);
                  textController.clear();
                  setState(() {});
                },
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Task', hintText: 'e.g. Buy Milk'
                ),
              )
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text('Add'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }

  _addTask() {
    TextField(
      controller: textController,
      onSubmitted: (text) {
        items.add(text);
        textController.clear();
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: textController,
              onSubmitted: (text) {
                items.add(text);
                textController.clear();
                setState(() {});
              },
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Text(items[index]);
                    }
                )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        tooltip: 'Add todo',
        child: Icon(Icons.edit),
      ),
    );
  }
}
