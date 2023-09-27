import 'package:flutter/material.dart';

import '../../widgets/time_state.dart';

class AttendanceInfor extends StatefulWidget {
  const AttendanceInfor({super.key});

  @override
  State<AttendanceInfor> createState() => _AttendanceInforState();
}

class _AttendanceInforState extends State<AttendanceInfor> {
  @override
  Widget build(BuildContext context) {
    return  Container(
              color: Colors.blue[200],
            child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 15.0,top: 15.0),
                   child: Row(
                     children: [
                       const CircleAvatar(backgroundImage: AssetImage("assets/images/student1.png"), radius: 40,),
                       const SizedBox(width: 15.0,),
                       Column( children: [ const Text("ASANE", style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                         Text("DERICK ENOW",style: TextStyle(color:Colors.grey[800],fontSize: 20.0))
                       ],
                       )
                     ],
                   ),
                 ),
                const SizedBox(height: 40.0,),
                 Expanded(
                   child: Container(
                     decoration: const BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0))
                     ),
                     child:  Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const SizedBox(height: 30.0),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // first container in the row
                              Container(
                                decoration:  BoxDecoration(
                                  color: Colors.grey[200],
                                    boxShadow:const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(0, 4)
                                      )
                                    ] ,
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:  Row(
                                    children: [
                                      const Text("12", style: TextStyle(fontSize: 50.0),),
                                      const SizedBox(width: 10.0,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          const Text("Friday", style: TextStyle(fontSize: 20.0),),
                                          Text("oct 2023", style: TextStyle(fontSize: 20.0,color: Colors.grey[500]),),

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              //second cart, we implement it, bellow
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    boxShadow:const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 3,
                                        offset: Offset(0, 4)

                                      )
                                    ] ,
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text("Everyday matters", style: TextStyle(fontSize: 15.0),),
                                      Text("Always check on your", style: TextStyle(fontSize: 15.0),),
                                      Text("Child", style: TextStyle(fontSize: 15.0))
                                    ],
                                  ),
                                )
                              )
                            ],
                         ),
                         const SizedBox(height: 10.0,),
                         const Padding(
                           padding: EdgeInsets.all(8.0),
                           child: Text("Attendance Records", style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),
                         ),
                         SizedBox(
                           height: 215,
                           child: ListView.builder(
                             itemCount: 6,
                               itemBuilder: (BuildContext context, int index){
                               index = index + 1;
                                 return Container(
                                   decoration: BoxDecoration(
                                     color: Colors.grey[200],
                                     boxShadow: [
                                       BoxShadow(
                                           color: Colors.black38.withOpacity(0.2),
                                           blurRadius: 5,
                                            spreadRadius: 2,
                                         offset: const Offset(4, 0)

                                       ),
                                     ]
                                   ),
                                   child: ListTile(
                                     dense: false,
                                     leading: Text("$index", style: const TextStyle(fontSize: 40),),
                                     trailing: const TimeState() ,
                                     title: Text("Computer security $index"),
                                     subtitle: const Text("Mr.Agbor Anderson"),
                                   ),
                                 );
                               }
                           ),
                         )
                       ],
                     ),
                   ),
                 )
               ],
            ),
          );
  }
}
