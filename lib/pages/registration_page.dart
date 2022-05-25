import 'dart:convert';
import 'dart:ui';
import 'package:api_project/pages/homepage.dart';
import 'package:api_project/widget/Button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);


  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late String name, email;

  //TextController to read text entered in text field
  final formkey = GlobalKey<FormState>();
  TextEditingController nC = TextEditingController();
  TextEditingController eC = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(children: [
          
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 605,
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    children: [
                     
                      Expanded(
                        flex: 2,
                        child: Form(
                            key: formkey,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 100,
                                    right: 25,
                                    left: 25,
                                  ),
                                  child: Column(
                                    children: [
                                     const Padding(
                                        padding:  EdgeInsets.fromLTRB(5, 0, 220, 2),
                                        child: Text("Full Name" , style:TextStyle( fontWeight: FontWeight.bold , fontSize: 15) ),
                                      ),
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(2),
                                        
                                        shadowColor: Colors.grey,
                                        child: TextFormField(
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter Name';
                                            }
                                            return null;
                                          },
                                          onSaved: (String? value) {
                                            name = value!;
                                          },
                                          controller: nC,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      28, 14, 3, 14),
                                              errorStyle: TextStyle(
                                                  fontSize: 15,
                                                  height: 0.3)),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Padding(
                                        padding:  EdgeInsets.fromLTRB(5, 0, 220, 2),
                                        child: Text("Job Name" , style:TextStyle( fontWeight: FontWeight.bold , fontSize: 15) ),
                                      ),
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(2),
                                       
                                        child: TextFormField(
                                         validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter Job Name';
                                            }
                                            return null;
                                          },
                                          onSaved: (String? value) {
                                            name = value!;
                                          },
                                          controller: eC,
                                          decoration: const InputDecoration(

                                              border: OutlineInputBorder(),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      28, 14, 3, 14),
                                              errorStyle: TextStyle(
                                                  fontSize: 15,
                                                  height: 0.3)),
                                        ),
                                      ),
                                     
                                      const SizedBox(
                                        height: 10,
                                      ),
                                     
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 140,
                                ),
                                Column(
                                  children: [
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(30),
                                      child:
                                     Button(
                                        title: "SIGN UP",
                                        onPress: () {
                                          if (formkey.currentState!
                                              .validate()) {
                                            RegistrationUser();
                                             Navigator.push(
                                                   context,
                                                   MaterialPageRoute(
                                                       builder: (context) =>
                                                            HomePage()));
                                            signup(context);
                                            return;
                                          } else {
                                            print("UnSuccessfull");
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    
                                    
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                         
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Future RegistrationUser() async {
    var APIURL = "https://reqres.in/api/users";

    Map mapeddata = {
      'name': nC.text,
      'email': eC.text,
      
    };
    print("JSON DATA: ${mapeddata}");

    http.Response response =
        await http.post(Uri.parse(APIURL), body: mapeddata);

    var data = jsonDecode(response.body);
    print("JSON DATA: ${data}");
  }
}

void signup(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text("Registration Successfully Completed"),
    content: Text("Please go to homepage"),
     actions: [
       Button(
         title: 'HomePage',
         onPress: (){
           Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) =>
                            HomePage()));
         },
       )
      ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}