import 'package:flutter/material.dart';
import 'package:to_do_app/util/colors.dart';

class mybuttons extends StatelessWidget {
  final String Buttonname;
  VoidCallback onpressed;
mybuttons({
    super.key,
    required this.Buttonname,
    required this.onpressed,
});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onpressed,
    child: Text(Buttonname),
      color: buttoncolor,
    );
  }
}
