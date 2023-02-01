import 'package:e_commerce_app/Controller/constant.dart';
import 'package:e_commerce_app/View/drawer.dart';
import 'package:e_commerce_app/Controller/provider.dart';
import 'package:e_commerce_app/View/gridview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  int buttonindex = 0;
  // int? index;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, getdata, child) {
      getdata.fetchQuestion();
      if (getdata.status == ProviderStatus.COMPLETED) {
        return Scaffold(
            drawer: const DrawerPage(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(builder: (context) {
                        return IconButton(
                            onPressed: (() {
                              Scaffold.of(context).openDrawer();
                            }),
                            icon: Icon(Icons.menu));
                      }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.amber,
                          backgroundImage: NetworkImage(
                              FirebaseAuth.instance.currentUser!.photoURL!),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 320,
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: 'What are you looking for ?',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          fillColor: Colors.black,
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
                    height: MediaQuery.of(context).size.height - 150,
                    // margin: EdgeInsets.only(bottom: 20),
                    child: GridviewPage(),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white);
      } else {
        return Center(child: const CircularProgressIndicator());
      }
    });
  }
}
