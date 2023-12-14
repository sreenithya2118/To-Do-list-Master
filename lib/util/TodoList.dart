import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/util/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {

  final String TaskName;
  final bool Completionstatus;
  Function(bool?)? onChanged;
  Function(BuildContext)? delete;

  TodoList({
    super.key,
    required this.TaskName,
    required this.Completionstatus,
    required this.onChanged,
    required this.delete
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25,left: 25,right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: delete,
            icon:Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color:taskcontainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                //CheckBox to mark finished or not //
                Checkbox(
                  activeColor: Colors.black,
                    value: Completionstatus,
                    onChanged: onChanged
                ),
                Text(TaskName,
                    style:GoogleFonts.roboto(
                        fontWeight:FontWeight.bold,
                        fontSize: 17,
                        color: Colors.white,
                        decoration: Completionstatus
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
