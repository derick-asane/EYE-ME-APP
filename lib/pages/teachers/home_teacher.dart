import 'package:eyeme/pages/teachers/teacher_notification.dart';
import 'package:eyeme/pages/teachers/teacher_profile.dart';
import 'package:flutter/material.dart';

import '../login.dart';
import 'classes_room.dart';




class HomeTeacher extends StatefulWidget {
  const HomeTeacher({super.key});

  @override
  State<HomeTeacher> createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _selectedIndex=1;
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController?.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    setState(() {
      if (_tabController?.index != 1) _selectedIndex = _tabController!.index;
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  // void navigateTopBar(int index){
  //    setState(() {
  //      _selectedIndex=index;
  //    });
  //  }

  final List<Widget> _pages=[
    //parent profile page
    TeacherProfile(),
    //attendance page
    ClassRoom(),
    //notification page
    TeacherNotification()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[800],
            bottom: TabBar(
                controller: _tabController,
                tabs:const [
                  Tab(icon: Icon(Icons.person, size: 40,),),
                  Tab(icon: Icon(Icons.home_rounded,size: 40),),
                  Tab(icon: Icon(Icons.notifications,size: 40),),
                ]),
            leadingWidth: 100,
            automaticallyImplyLeading: false,
            actions: [
              PopupMenuButton<String>(itemBuilder: (BuildContext context)=>[
                  const PopupMenuItem<String>(
                      value: 'logout',
                      child: Text("Logout"))
              ],
                onSelected: (String value){
                  switch(value){
                    case 'logout': Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false);
                        break;
                  }
                },
              )
            ],
            leading: const Center(
              child: Text(
                "EYE-ME",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children:const [
              //parent profile page
              TeacherProfile(),
              //attendance page
              ClassRoom(),
              //notification page
              TeacherNotification()

            ] ,

          ),
        )
    );
  }
}
