import 'package:flutter/material.dart';
import 'package:semana12_1_lunes_preferences/vistaConfig.dart';

class vista1 extends StatelessWidget {
  const vista1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Preferences"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Text('PREFERENCES EN FLUTTER',style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold
              ),),
            )
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context){
                  return vistaConfig();
                }));
          }),
      
    );
  }
}
