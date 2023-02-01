import 'package:e_commerce_app/Controller/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:number_selection/number_selection.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  List clr = [
    Colors.red,
    Color.fromARGB(255, 83, 14, 14),
    Colors.green,
    Colors.amber
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<DataProvider>(builder: (context, getdata, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.amber),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "My Cart",
              style: TextStyle(color: Colors.amber),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL!),
                ),
              )
            ],
            elevation: 0,
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 600,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: double.infinity,
                        height: 130,
                        decoration: BoxDecoration(
                            color: clr[index],
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Container(
                                width: 110,
                                height: 120,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    color: Color.fromARGB(255, 84, 70, 70),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 100,
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getdata.data.products[index].brand,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      getdata.data.products[index].price
                                          .toString(),
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                width: 40,
                                height: 80,
                                child: NumberSelection(
                                  theme: NumberSelectionTheme(
                                    draggableCircleColor: Colors.white,
                                    iconsColor: Colors.black,
                                    numberColor: Colors.red,
                                    backgroundColor: Colors.white,
                                  ),
                                  initialValue: 1,
                                  minValue: -10,
                                  maxValue: 10,
                                  direction: Axis.vertical,
                                  withSpring: true,
                                  onChanged: (int initialValue) =>
                                      print("value: $initialValue"),
                                  enableOnOutOfConstraintsAnimation: true,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
