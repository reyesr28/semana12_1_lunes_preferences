import 'package:shared_preferences/shared_preferences.dart';

class preferencias{

  SharedPreferences? preferencia;
  bool wifi=false;
  String red="";
  bool orientacion=false;

  Future<SharedPreferences?> get preferences async{
    if(preferencia==null){
      preferencia=await SharedPreferences.getInstance();
      wifi=preferencia?.getBool("wifi")??false;
      red=preferencia?.getString("red")??"";
      orientacion=preferencia?.getBool("orientacion")??false;
    }
    return preferencia;
  }

  Future<preferencias> init() async{
    preferencia=await preferences;
    return this;
  }

  Future<void> guardarWifi() async{
    await preferencia?.setBool("wifi", wifi);
  }

  Future<void> guardarRed() async{
    await preferencia?.setString("red", red);
  }

  Future<void> guardarOrientacion() async{
    await preferencia?.setBool("orientacion", orientacion);
  }

}