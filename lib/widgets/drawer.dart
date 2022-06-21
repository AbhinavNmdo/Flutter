import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  String imageURL = "https://avatars.githubusercontent.com/u/86583211?v=4";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("Abhinav Namdeo", style: TextStyle(
                color: Colors.white,
              ),),
              accountEmail: Text("abhaynam22@gmail.com", style: TextStyle(
                color: Colors.white,
              ),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageURL),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text(
              'Home',
              textScaleFactor: 1.2,
              style: TextStyle(
              color: Colors.white,
            ),),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text(
              'Profile',
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text(
              'Mail me',
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.arrow_left_circle_fill,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),),
          )
        ],
      ),
    );
  }
}
