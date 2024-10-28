import 'package:flutter/material.dart';
import 'package:semana12_1_lunes_preferences/pref/preferencias.dart';

class vistaConfig extends StatefulWidget {
  const vistaConfig({super.key});

  @override
  State<vistaConfig> createState() => _vistaConfigState();
}

class _vistaConfigState extends State<vistaConfig> {

  preferencias pref=preferencias();

  @override
  Widget build(BuildContext context) {

    TextEditingController usuController=
        TextEditingController(text: pref.red);

    return Scaffold(

      appBar: AppBar(
        title: Text('Configuración de sistema'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.wifi),
                ),
                Expanded(child: Text('Activar Wifi: ',
                style: TextStyle(
                  fontSize: 18
                ),),),
                Switch(value: pref.wifi,
                    onChanged: (value){
                        setState(() {
                          pref.wifi=value;
                          pref.guardarWifi();
                        });
                    }),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.signal_cellular_alt),
                ),
                Expanded(child: Text('Ingrese Clave Red: ',
                  style: TextStyle(
                      fontSize: 18
                  ),),),

                Container(
                  width: 120,
                  child:  TextField(
                    controller: usuController,
                    onChanged: (value){
                      pref.red=value;
                      pref.guardarRed();
                    },
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.screen_lock_rotation_outlined),
                ),
                Expanded(child: Text('Cambiar Orientación: ',
                  style: TextStyle(
                      fontSize: 18
                  ),),),

                Checkbox(
                    value: pref.orientacion,
                    onChanged: (value){
                      setState(() {
                        pref.orientacion=value!;
                        pref.guardarOrientacion();
                      });
                    })
              ],
            ),


          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    pref.init().then((value){
      setState(() {
        pref=value;
      });
    });
  }
}
