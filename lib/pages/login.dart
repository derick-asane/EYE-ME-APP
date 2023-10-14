import 'dart:convert';
import 'package:eyeme/models/credntials_model.dart';
import 'package:eyeme/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




final List<String> user = ['Parent', 'Attendance service','Teacher' ,'Admin'];
class Login extends StatefulWidget {
    const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String _selectedItem ="Parent";
  final _formKey = GlobalKey<FormState>();
  TextEditingController passCodeController = TextEditingController();

  Future<void> fetchData(void Function() redirectionCallback) async {
    Uri url= Uri.parse('http://192.168.43.34:8080/api/students/authParent');
    if(_selectedItem == "parent"){
       url = Uri.parse('http://192.168.43.34:8080/api/students/authParent');
    }else if(_selectedItem == "teacher"){
      // url = Uri.parse('https://api.example.com/data');
    }else if(_selectedItem == "admin"){
      // url = Uri.parse('https://api.example.com/data');
    }else{
     // url = Uri.parse('https://api.example.com/data');
    }


    try {
      final response = await http.post(url, body: {'passcode': passCodeController.text});

      if (response.statusCode == 200) {
        // Request successful, parse the response body
        final  jsonData = json.decode(response.body);
        if (kDebugMode) {
          print("logging successfully");
        }
        final dynamic usersData = jsonData['data'];
        List<dynamic> usersJson = [];
        if (usersData != null) {
           if (usersData is Map<String, dynamic>) {
            usersJson.add(usersData);
          }
        }
        // if (usersJson.isNotEmpty) {
        //   // Process the user data
        //   for (var user in usersJson) {
        //     // Access user properties and perform operations
        //     final int id = user['id'];
        //     final String name = user['name'];
        //     final String email = user['email'];
        //
        //     // Do something with the user data
        //     print('User ID: $id');
        //     print('Name: $name');
        //     print('Email: $email');
        //     print('---');
        //   }

        if (usersJson.isNotEmpty) {

          redirectionCallback();
        }

      } else {
        // Request failed
        print('Request failed with status: ${response.statusCode}');
        print("logging failed");
      }
    } catch (error) {
      // Error occurred during the request
      print('Error: $error');
      print("error failed");

    }
  }

  void login(){
    if (kDebugMode) {
      print(_selectedItem);
    }
    if (kDebugMode) {
      print(passCodeController);
    }
    void redirect() {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
    }
    fetchData(redirect);


  }
  final List<String> userRoles = ['Parent', 'Attendance Service', 'Teacher', 'Admin'];

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
