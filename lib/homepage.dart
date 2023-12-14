import 'package:flutter/material.dart';
import 'package:to_do_app/util//TodoList.dart';
import 'package:to_do_app/util/colors.dart';
import 'package:to_do_app/util/dialogbox.dart';
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
final _controller = TextEditingController();
  //<----> List of all Tasks in the app//
  List todoList = [
    ["Make Coffee",false],
    ["Edit Videos",false]
  ];
   //<-----> CheckBox checked/Task completion/<-----> //

  void checkBoxchanged(bool? value,int index) {
        setState(() {
          todoList[index][1] = !todoList[index][1];
        });
  }

  void savenewtask() {
    setState(() {
      todoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //Creating a new task using Floating Action Button //
  void createnewtask() {
    showDialog(context: context,
        builder: (context) {
      return dialogbox(
        tasknamecontroller:_controller,
        onsave: savenewtask,
        oncancel: Navigator.of(context).pop,
      );
    });
  }

  //Deleting a task using delete Slidable //

void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: appbar,
        title: Center(child: Text("My Tasks")),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context,index) {
          return TodoList(
            TaskName: todoList[index][0],
            Completionstatus:todoList[index][1],
            onChanged:(value) =>checkBoxchanged(value,index),
            delete: (context)=> deleteTask(index),
          );
        },
      ),
    );
  }
}
