import 'package:flutter/material.dart';


class TimeState extends StatefulWidget {
  const TimeState({super.key});

  @override
  State<TimeState> createState() => _TimeStateState();
}

class _TimeStateState extends State<TimeState> {
  @override
  Widget build(BuildContext context) {
    return Container(

      width: 100,
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("present", style: TextStyle(fontSize: 20, color: Colors.white),),
          Text("11:45", style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
