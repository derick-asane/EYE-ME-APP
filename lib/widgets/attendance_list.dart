import 'package:flutter/material.dart';




class AttendanceList extends StatefulWidget {
  final int index;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const AttendanceList({
    required this.index,
    required this.isChecked,
    required this.onChanged,
    super.key});

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  late bool _isChecked;


  void submit(){

  }
  @override
  void initState() {
    _isChecked = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pos = widget.index + 1;
    return GestureDetector(
      onTap: ()=>{
            //submitting the form
            submit()
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration:  BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(1,2)
              )
            ],

            borderRadius: BorderRadius.circular(8)
        ),
        child: ListTile(
          title: const Text("derick"),
          subtitle:  Text("Good morning $_isChecked"),
          trailing: Transform.scale(
            scale: 1.8,
            child: Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.blue[200]
              ),
              child: Checkbox(
                  activeColor: Colors.red,
                  value: _isChecked,
                  onChanged: (bool? value){
                    setState(() {
                      _isChecked= value ?? false;
                    });
                  } ),
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: const AssetImage("assets/images/girl.jpg") ,
            radius: 30.0,
            child: Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: CircleAvatar(
                radius: 12.0,
                backgroundColor: Colors.white,
                child: Text("$pos"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
