import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../component/form_component.dart';
import 'home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var emailController = TextEditingController();
  var passwordController =TextEditingController();
  var firstnameController =TextEditingController();
  var lastnameController =TextEditingController();
  var formKey= GlobalKey<FormState>();
  bool ispassword =true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key:formKey ,
              child: Column(
                children: [
                  Text('Regester',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(
                    height: 40,
                  ),

                  defultTextFeild(
                      label: 'First name',
                      type: TextInputType.text,
                      prefix:   Icons.face,
                      controller: firstnameController,
                      validate: (value){
                        if(value.isEmpty){
                          return 'First name must not be empty';
                        }
                        return null;
                      }
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  defultTextFeild(
                      label: 'phone number',
                      type: TextInputType.number,
                      prefix:   Icons.phone,
                      controller: lastnameController,
                      validate: (value){
                        if(value.isEmpty){
                          return 'phone number must not be empty';
                        }
                        return null;
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defultTextFeild(
                      label: 'email adress',
                      type: TextInputType.emailAddress,
                      prefix:  Icons.email,
                      controller: emailController,
                      validate: (value){
                        if(value.isEmpty){
                          return 'email must not be empty';
                        }
                        return null;
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defultTextFeild(
                      label: 'Password',
                      type: TextInputType.visiblePassword,
                      prefix:  Icons.lock,
                      suffix: ispassword ? Icons.remove_red_eye :Icons.visibility_off ,
                      controller: passwordController,
                      isPasswordd: ispassword,
                      validate: (value){
                        if(value.isEmpty){
                          return 'Password must not be empty';
                        }
                        return null;
                      },
                      suffixPressed: (){
                        setState(() {
                          ispassword = !ispassword;
                        });
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defultButton(
                      text: 'Done',
                      function: (){
                        if(formKey.currentState!.validate()){
                          print(emailController.text);
                          print(passwordController.text);
                          print(firstnameController.text);
                          print(lastnameController.text);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );

                        }
                      }
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}

