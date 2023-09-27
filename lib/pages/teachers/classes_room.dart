import 'package:eyeme/pages/teachers/record_attendance.dart';
import 'package:flutter/material.dart';



class ClassRoom extends StatefulWidget {
  const ClassRoom({super.key});

  @override
  State<ClassRoom> createState() => _ClassRoomState();
}

class _ClassRoomState extends State<ClassRoom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            "assets/images/cross.png",
            height: 200,
          ),
        ),
        Text("Available classes", style: TextStyle(fontSize: 20.0, color: Colors.blue[200]), ),
         Column(
          children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 240,
                  child: ListView.builder(
                    itemCount: 6,
                      itemBuilder: (context, int index){
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                  BoxShadow(
                                  color: Colors.black12,
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                      offset: Offset(1,2)
                                  )
                            ],
                          ),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: Column(
                              children: [
                                Icon(Icons.people_alt_rounded, color: Colors.blue[200],size: 30,),
                                const Text("form 5")
                              ],
                            ),
                            title: const Text("Physical chemistry"),
                            subtitle: const Text("Student 80"),
                            onTap:()=> Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> const RecordAttendance())),
                          ),
                        );
                      }
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}
