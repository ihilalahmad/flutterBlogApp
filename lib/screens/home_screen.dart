import 'package:blog_app_flutter/screens/add_post_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        actions: [
          InkWell(
              child: Icon(Icons.add),
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddPostScreen()));
            },
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
