import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taska/blocs/auth_bloc.dart';
import 'package:taska/pages/register.dart';
import '../blocs/auth_events.dart';
import '../component/form_component.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController =TextEditingController();
  var formKey= GlobalKey<FormState>();
  bool ispassword =true;

   late AuthBloc authBloc;

  @override
  void initState(){
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

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
                Text('Login',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
                SizedBox(
                  height: 40,
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
                    text: 'login',
                    function: () {
                      if(formKey.currentState!.validate()){
                        print(emailController);
                        print(passwordController);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                      authBloc.add(LoginButtonPressed(email: emailController.text, password: passwordController.text));
                    }
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('don have an acount'),
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    }, child: Text('register now',
                      style: TextStyle(
                          color: Colors.deepOrange
                      ),))
                  ],
                )
              ],

            ),

          ),

        ),
      ),
    );
  }
}
