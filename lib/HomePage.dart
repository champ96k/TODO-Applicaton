import 'package:flutter/material.dart';
import 'package:todo_with_sql_flight/note_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical:34),
            child: Container(
              color: Colors.teal,
              height: MediaQuery.of(context).size.width * 0.75,  
              width: double.infinity,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("images/pic1.png"), 
              )
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),  
            child: Text("Welcome to Tasks",
            style: TextStyle(
              fontSize: 28, 
              fontWeight: FontWeight.w300,
              letterSpacing: 0.75,
            ),
            ),
          ),
          



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text("keep track of important things that you need",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
            ),
            ),
          ),

           Padding(
            padding: const EdgeInsets.only(top:3,right: 18,left: 18,bottom: 28),
            child: Text(" to get done in one place",
             style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0, 
            ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:36),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NoteList()));
              },
              child:Text("Get started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w300
                ),
                ),
             ),
          ),
        ],
       ),
      ),
    );
  }
}