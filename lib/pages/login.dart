import 'package:eyeme/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



final List<String> user = ['Parent', 'Attendance service','Teacher' ,'Admin'];
class Login extends StatefulWidget {
    const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _selectedItem= 'Parent';
  final _formKey = GlobalKey<FormState>();
  TextEditingController passCodeController = TextEditingController();

  void login(){
    if (kDebugMode) {
      print(_selectedItem);
    }
    if (kDebugMode) {
      print(passCodeController);
    }
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
  }

  @override
  Widget build(BuildContext context) {
    var mySize= MediaQuery.of(context).size;

    return  Scaffold(

      resizeToAvoidBottomInset: false,
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: mySize.height * 15.0/360),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Hey, Welcome!",
                  style: TextStyle(
                      color: Colors.blue[200],
                      fontWeight:  FontWeight.bold,
                      fontSize: 25.0,
                  ),
                ),
              ),
              SizedBox(height: mySize.height * 10.0/360.0),
              Text(
                "Please enter login credentials bellow.",
                style: TextStyle(color: Colors.grey[500]),
              ),
              SizedBox(height: mySize.height * 10.0/360.0),
               Image.asset("assets/images/login.png", width: 150.0,height: 150.0,),
              SizedBox(height: mySize.height * 10.0/360.0),
            Form(
              key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: passCodeController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "PassCode"
                            ),
                          ),
                      const SizedBox(height: 10.0,),
                    DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2)),
                          ),
                          value: _selectedItem,
                          onChanged:(String? newValue) => setState(() {
                              _selectedItem = newValue!;
                            }),
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: 'Parent',
                          child: Text('Parent'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Attendance service',
                          child: Text('Attendance service'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Teacher',
                          child: Text('Teacher'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Admin',
                          child: Text('Admin'),
                        ),
                      ],
                    ),



                      const SizedBox(height: 40.0,),
                      GestureDetector(
                        onTap: () => login(),
                        child: Container(
                          padding: const EdgeInsets.all(25.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Center(child:
                          Text(
                              "Login",
                                style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                          )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
             ),

            ],
          ),
        ),
      ),
    );
  }
}
