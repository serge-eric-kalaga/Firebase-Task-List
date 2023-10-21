import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase TaskList',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(color: Colors.black45),
        child: Column(
          children: [TaskForm()],
        ),
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Column TaskForm() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          child: TextField(
            controller: textEditingController,
            autocorrect: true,
            onChanged: (value) {
              print('Text changed');
            },
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black54)),
            onPressed: () {},
            child: Text("Add task"),
          ),
        )
      ],
    );
  }
}
