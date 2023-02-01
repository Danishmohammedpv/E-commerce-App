import 'package:e_commerce_app/View/cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Controller/firebase.dart';
import 'login_screen.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            // height: 88,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                accountName: Text(
                  "${FirebaseAuth.instance.currentUser!.displayName}",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail:
                    Text("${FirebaseAuth.instance.currentUser!.email}"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL!),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            // onTap: () {
            //   Navigator.pop(context);
            // },
          ),
          ListTile(
            leading: Icon(Icons.notifications_none_outlined),
            title: Text("Notification"),
            // onTap: () {
            //   Navigator.pop(context);
            // },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            // onTap: () {
            //   Navigator.pop(context);
            // },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Shopping List"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => CartPage())));
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Rate the App"),
            // onTap: () {
            //   Navigator.pop(context);
            // },
          ),
          ListTile(
            leading: Icon(Icons.notes),
            title: Text("Terms & Conditions"),
            // onTap: () {
            //   Navigator.pop(context);
            // },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip_outlined),
            title: Text("Privacy Policy"),
            // onTap: () {
            //   Navigator.pop(context);
            // },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About Us"),
            // onTap: () {
            //   Navigator.pop(context);
            // },
          ),
          ListTile(
            leading: Icon(
              Icons.logout_sharp,
              color: Colors.red,
            ),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () async {
              await FirebaseServices().signOut();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
