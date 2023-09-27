import 'package:eyeme/pages/parents/Attendance_infor.dart';
import 'package:eyeme/pages/parents/parent_notification.dart';
import 'package:eyeme/pages/parents/parents_profile.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
     ParentProfile(),
    //attendance page
    AttendanceInfor(),
    //notification page
    NotificationP()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[200],
            bottom: TabBar(
              controller: _tabController,
                tabs:const [
              Tab(icon: Icon(Icons.person, size: 40,),),
              Tab(icon: Icon(Icons.alarm_on_rounded,size: 40),),
              Tab(icon: Icon(Icons.notifications,size: 40),),
            ]),
            leadingWidth: 100,
            automaticallyImplyLeading: false,
            actions:  [
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
                ParentProfile(),
                //attendance page
                AttendanceInfor(),
                //notification page
                NotificationP(),
              ] ,

      ),
    )
    );
  }
}
