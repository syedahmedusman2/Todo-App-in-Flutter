import 'package:flutter/material.dart';

class App extends StatefulWidget {
 
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<dynamic> lst = ["1",2,3];
  var output = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    ListView.builder(
      itemCount: lst.length,
      itemBuilder: (context, index){
      return Container(
        height: 45,
        
        margin: EdgeInsets.only(top: 10),
        child: ListTile(
          
          
          title: Text('${lst[index]}'),
          trailing:
              Container(
                width: 50,
                child: Row(
                  children: [
                    GestureDetector(onTap: (){
                      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("Edit Item"),
          content: TextField(onChanged: (value){
            output = value;
          },
          ),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
              setState(() {

                lst.replaceRange(index, index+1, {output});
              });

            }, child: Text("ADD"))
          ],

        );

      });
                      
                    } ,child: Icon(Icons.edit),),


                    GestureDetector(onTap: (){
                      setState(() {
                        lst.removeAt(index);
                      });
                    } ,child: Icon(Icons.delete),),
                  ],
                ),
              ),

             
            
          ),
          
        
          
          

          

        
      );
    }
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      
      
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("Add Item"),
          content: TextField(onChanged: (value){
            output = value;
          },
          ),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
              setState(() {

                lst.add(output);
              });

            }, child: Text("ADD"))
          ],

        );

      }
      );
    }, child: Icon(Icons.add),
    backgroundColor: Colors.green,
    
    ),
    );


      
    
  }
}

// GestureDetector(onTap: (){
//                   setState(() {
//                     lst.removeAt(index);
//                   });
//                 },child: Icon(Icons.delete)),