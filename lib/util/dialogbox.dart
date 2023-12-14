import 'package:flutter/material.dart';
import 'package:to_do_app/util/buttons.dart';
import 'package:to_do_app/util/colors.dart';

class dialogbox extends StatelessWidget {
  final tasknamecontroller;
  VoidCallback onsave;
  VoidCallback oncancel;
  dialogbox({
    super.key,
    required this.tasknamecontroller,
    required this.onsave,
    required this.oncancel,
});



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: tasknamecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
        ),
                hintText: "ADD A TASK",
                )
              ),

            // <-----> Buttons to Save and Cancel adding of new tasks  <-----> //

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                mybuttons(Buttonname: "SAVE", onpressed: onsave),
                const SizedBox(width: 10),
                mybuttons(Buttonname: "CANCEL", onpressed: oncancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
