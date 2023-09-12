import 'package:flutter/material.dart';


class ParentProfile extends StatefulWidget {
  const ParentProfile({super.key});

  @override
  State<ParentProfile> createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {
  var skyb = const Color(0x009bb5e9);
  @override
  Widget build(BuildContext context) {
    var mySize= MediaQuery.of(context).size;
    return  Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                    ) ,
                    height: mySize.height * 50.0/360.0,
                  ),

                 Container(
                    margin: EdgeInsets.only(top:mySize.height * 10.0/360.0),

                   child: const Center(
                     child:  CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/images/student1.png"),
                      ),
                   ),
                 ),
                  Container(
                    margin: EdgeInsets.only(top: mySize.height * 80.0/360.0  ) ,
                    child:const Center(
                      child:  Column(
                        children: [
                          Text("ASANE", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                          Text(
                            "DERICK ENOW",
                            style: TextStyle(
                                fontSize:20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey ),)
                        ],
                      ),
                    ),
                  ),
                    //this is the left container containing the school
                    Padding(
                      padding: const EdgeInsets.only(top: 220.0,left: 10.0),
                      child: Container(
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent[100],
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: const Column(
                          children: [
                            SizedBox(height: 10.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.school,size: 35 ,),
                                  SizedBox(width: 10.0,),
                                  Text("school", style: TextStyle(fontSize: 25.0),)
                                ],
                              ),
                            SizedBox(height: 10.0,),
                            Text("AICS", style: TextStyle(fontSize: 40.0,color: Colors.white),),
                            SizedBox(height: 30.0,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(height: 5.0,thickness: 2.0, color: Colors.white,),
                            ),
                            SizedBox(height: 30.0,),
                            // this is for the class room bellow

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.home,size: 35 ,),
                                SizedBox(width: 10.0,),
                                Text("class", style: TextStyle(fontSize: 25.0),)
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Text("SE3", style: TextStyle(fontSize: 40.0,color: Colors.white),),
                            SizedBox(height: 10.0,),
                          ],
                        ),

                      ),
                    ),


                  //HOURS OF ABSENCES
                  Padding(
                    padding: const EdgeInsets.only(top: 220.0, left: 200.0),
                    child: Container(
                      width: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent[100],
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: const Column(
                        children: [
                          SizedBox(height: 10.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_time,size: 35 ,),
                              SizedBox(width: 10.0,),
                              Text("Absence ", style: TextStyle(fontSize: 20.0),)
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Text("15 hrs", style: TextStyle(fontSize: 30.0,color: Colors.white),),
                          SizedBox(height: 20.0,),
                        ],
                      ),

                    ),
                  ),

                  //school fees bellow
                  Padding(
                    padding: const EdgeInsets.only(top: 370.0, left: 200.0),
                    child: Container(
                      width: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: const Column(
                        children: [
                          SizedBox(height: 10.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.money_rounded,size: 35 ,),
                              SizedBox(width: 10.0,),
                              Text("Fees", style: TextStyle(fontSize: 25.0),)
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Text("515000f", style: TextStyle(fontSize:30.0,color: Colors.white),),
                          SizedBox(height: 20.0,),

                        ],
                      ),

                    ),
                  ),


                ],
              )

            ],
        );
  }
}
