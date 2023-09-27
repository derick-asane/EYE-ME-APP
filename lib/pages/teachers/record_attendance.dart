import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widgets/attendance_list.dart';


class RecordAttendance extends StatefulWidget {
  const RecordAttendance({super.key});

  @override
  State<RecordAttendance> createState() => _RecordAttendanceState();
}

class _RecordAttendanceState extends State<RecordAttendance> {
  @override
  Widget build(BuildContext context) {

    List<bool> isChecked = List.generate(30, (index) => false);
    if (kDebugMode) {
      print(isChecked);
    }
    var me="SE3";
    var mydate = "Friday 6";
    Size mySize = MediaQuery.of(context).size ;
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0,left: 10.0,right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "CLASS : $me",
                       style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    mydate,
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(thickness: 5.0,color: Colors.blue[200],),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: mySize.height * 260.0/360.0 ,
                child: ListView.builder(
                  itemCount: 30,

                    itemBuilder: (BuildContext context, int index ) {

                      return AttendanceList(
                        index: index,
                        isChecked: isChecked[index],
                        onChanged: (bool value) {
                          setState(() {
                            isChecked[index] = value;
                          });
                        },
                      );
                    },
              ),
            ),
            ),
            //bellow button here ...

            Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                height: 50.0,
                width: 360.0,
                color: Colors.blue[200],
                child: const Center(
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0
                      ),
                    ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
