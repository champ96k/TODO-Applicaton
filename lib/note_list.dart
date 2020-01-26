import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_with_sql_flight/Note.dart';
import 'package:todo_with_sql_flight/database_helper.dart';
import 'package:todo_with_sql_flight/note_detail.dart';


class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  Databasehelper databaseHelper = Databasehelper();
  List<Note> noteList;

  int count=0;
  @override
  Widget build(BuildContext context) {
    if(noteList==null) {
      noteList = List <Note>();
      updateListView();
    }
    return Scaffold(

      appBar: AppBar(
        title: Text("TO DO"),
        backgroundColor: Colors.redAccent,
      ),

      body: count == 0 ? new 
      Image(
        height: double.infinity,
        fit: BoxFit.fitWidth,
        image: AssetImage("images/pic2.png"),
      ) : getNoteListView(),

       bottomNavigationBar: BottomAppBar(
        child:ListTile(
          leading: Icon(Icons.menu),
          trailing: Icon(Icons.more_vert),
        ),
      ),
      
            floatingActionButton: FloatingActionButton(
              elevation: 8.0,
              onPressed: () {
                navigateToDetails(Note('',' ',2,), 'Add Note' );
              },
              child: Icon(Icons.add),
            ),
            floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
          );
        }
      

        ListView getNoteListView() {
          return ListView.builder(
            itemCount: count,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
               // color: Colors.purpleAccent,
                elevation: 4,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("images/pic3.png"), 
                  ),

                  title: Text(this.noteList[position].title),
                  subtitle: Text(this.noteList[position].date),

                  trailing: GestureDetector(
                    child: Icon(Icons.open_in_new, color: Colors.redAccent),
                    onTap: () {
                      navigateToDetails(this.noteList[position],"Edit To-Do");
                    },
                  ),
                ),
              );
            }
          );
        }
      

  void navigateToDetails(Note note, String title) async {

    bool result= await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note,title);
    } ));

    if(result==true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((Database)
     {
       Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
       noteListFuture.then((noteList)
       {
         setState(() {
           this.noteList = noteList;
           this.count = noteList.length;
         });
       });
     });
  }

}