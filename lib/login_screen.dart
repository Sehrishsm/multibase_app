import 'package:flutter/material.dart';
import 'package:multi_base_app/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  final ageController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      centerTitle: true,
        title: Text('login'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: InputDecoration(
                hintText: 'Age',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap:() async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());
                //admin , user, teacher
                sp.setString('useType','student');
                sp.setBool('islogin', true);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentScreen()));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.orange,
                child: Center(
                  child: Text('Login',style: TextStyle(
                      color: Colors.white,fontSize:18,fontWeight: FontWeight.bold ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
