import 'package:flutter/material.dart';
import 'package:task_list_firebase/models/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

  late List<Task> tasks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tasks = [];
  }

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
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  child: TextField(
                    controller: textEditingController,
                    autocorrect: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black54)),
                    onPressed: () {
                      setState(() {
                        tasks.add(Task(name: textEditingController.text));
                      });
                    },
                    child: Text("Add task"),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 20, 5, 0),
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Checkbox(
                      value: tasks[index].isCompleted,
                      onChanged: (value) {
                        setState(() {
                          tasks[index].isCompleted = value;
                        });
                      }),
                  title: Text('${tasks[index].name}'),
                ),
              ),
            )
          ],
        ),
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
