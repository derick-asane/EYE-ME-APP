import 'package:eyeme/pages/parents/notification_detail.dart';
import 'package:flutter/material.dart';

class NotificationP extends StatefulWidget {
  const NotificationP({super.key});

  @override
  State<NotificationP> createState() => _NotificationPState();
}

class _NotificationPState extends State<NotificationP> {

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
           Center(
             child: Image.asset(
               "assets/images/reminder.png",
               height: 250,
             ),
           ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: 15,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.add)
                          ,) ,
                        title: const Text("Dear parents we here by..."),
                        subtitle: const Text("Today "),
                        trailing: const Text("12:45", style: TextStyle(color: Colors.white),),
                        onTap:()=> Navigator.push(context,
                           MaterialPageRoute(builder: (context)=> NotificationDetail())),
                      ),
                    );
                  }),
            ),
          )
        ],
      );

  }
}

