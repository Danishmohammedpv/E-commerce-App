import 'package:e_commerce_app/Controller/firebase.dart';
import 'package:e_commerce_app/View/home_screen.dart';
import 'package:e_commerce_app/Controller/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, getdata, child) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              SizedBox(
                height: 160,
              ),
              Center(
                  child: Text(
                'Welcome To E-commerce App',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 19),
              )),
              SizedBox(
                height: 100,
              ),
              Text('Login to your account',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 370,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Email / Mobile',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.5, color: Colors.white),
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 370,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.5, color: Colors.white),
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 250),
                child: ElevatedButton(
                  onPressed: (() {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => HomePage(),
                    //     ));
                  }),
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                ),
              ),
              TextButton(
                  onPressed: (() {}),
                  child: Text(
                    'Forgot your password ?',
                    style: TextStyle(color: Colors.white),
                  )),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text(
                          'Don\'t have an account ? ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text('OR', style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: (() async {
                      await FirebaseServices().signInWithGoogle();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    }),
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    child: Row(children: <Widget>[
                      new Image.asset(
                        'asset/Google-Icon-PNG_rwscww.png',
                        height: 30.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      new Expanded(
                        child: Text('Sign in with Google'),
                      ),
                    ])),
              )
            ],
          ),
          backgroundColor: Colors.blue[900],
        ),
      );
    });
  }
}
