
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
 

class Counter1 extends ChangeNotifier{


int _counter1 = 0;
int get counter1 => _counter1;

int _counter2 = 0;
int get counter2 => _counter2;



set counter1(int val1){
 _counter1 = val1;
  notifyListeners();

}

set counter2(int val2){
 _counter2 = val2;
 notifyListeners();
}

setnum(String name,int val)async{
final prefs = await SharedPreferences.getInstance();
prefs.setInt(name, val);
}

getum(String name)async{
  final prefs = await SharedPreferences.getInstance();
  int val = prefs.getInt(name) ?? 0;
  
  notifyListeners();
  return val;
}

getnums()async{
  _counter1=await getum('counter1');
  _counter2=await getum('counter2');
  percen();
  percenprog();
  notifyListeners();
}
Counter1(){
  getnums();
}

resetcounter(){
  _counter1=1;
  _counter2=0;
  setnum('counter1', _counter1);
  setnum('counter2', _counter2);
  percen();
  percenprog();
  notifyListeners();
}
incrementor1(){
  _counter1++;
  setnum('counter1', _counter1);
  percen();
  percenprog();
  notifyListeners();
}

decrementor1(){
  if(_counter1<=0){
    _counter1=0;
  }
  else if(_counter1==_counter2)
  {}
  else{
    _counter1--;
  }
  setnum('counter1', _counter1);
  percen();
  percenprog();
  notifyListeners();
}

incrementor2(){
  if(_counter2>=_counter1){
    _counter2=_counter1;


  }
  else{
  _counter2++;
  percen();
  setnum('counter2', _counter2);
  percenprog();
  }
  notifyListeners();
}

decrementor2(){
  if(_counter2<=0){
  _counter2=0;
  }
 
  else{
    _counter2--;
  }
  setnum('counter2', _counter2);
  percen();
  percenprog();
  notifyListeners();
}


num _perc = 0;
num get perc => _perc;


var _color=Colors.white;
final _colorgreen= Colors.green;
final _coloryellow= Colors.yellow;
final _colorred = Colors.red;
get color=> _color;
set color(var _color){
    _color=_color;
}
set perc(num val3){

  _perc=val3;
  notifyListeners();
}
percen(){
  _perc=(counter2 / counter1 * 100).floor();
  if(_perc<=60){
    _color=_colorred;
  }
  else if(_perc>=60 && _perc<=74){
    _color=_coloryellow;
  }
  else{
    _color=_colorgreen;
  }
  notifyListeners();
}
double _percprog = 0;
double  get percprog => _percprog;

set percprog(double val4){

  _percprog=val4;
  notifyListeners();
}

percenprog(){
  _percprog= counter2 / counter1 ;
  notifyListeners();
}



} 
