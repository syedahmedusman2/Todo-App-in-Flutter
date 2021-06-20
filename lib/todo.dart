import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
   @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var output = "";
  List<dynamic> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              border: Border.all(color: Colors.green,
              width: 2.5
              
              ),
              // color: Colors.green
            ),
            height: 45,
            margin: EdgeInsets.only(top:10),
            child: ListTile(
              
              title: Text('${list[index]}'),
              trailing: Container(
                
                width: 50,
                child: Row(
                  children: [
                   
                      GestureDetector(onTap: (){
                        setState(() {
                          list.removeAt(index);
                        });

                      }, child: Icon(Icons.delete_rounded),
                      
                      ),
                    
                    
                      GestureDetector(onTap: (){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text("Edit Item"),
                            content: TextField(onChanged: (value){
                              output=value;
                            },
                            ),
                            actions: [
                              ElevatedButton(onPressed: (){
                                Navigator.of(context).pop();
                                setState(() {
                                  list.replaceRange(index, index+1, {output});
                                });

                              }, child: Text("Edit"))
                            ],
                          );
                        });
                      },child: Icon(Icons.edit_rounded),),
                    
                  ],
                ),
              ),
            ),
          );
          

      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("ADD"),
            content: TextField(onChanged: (value){
              output = value;
            },
            ),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                setState(() {
                  list.add(output);
                });
              }, child: Text("ADD"),
              style: ElevatedButton.styleFrom(
      primary: Colors.green,
    ),
              )
            ],

          );

        });

      },child: Text("ADD"),
      backgroundColor: Colors.green,
    )
    ); 
  }
}