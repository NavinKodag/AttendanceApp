
import 'package:attendance_app/blocs/newcounters.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/widgets/getnum.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter1>.value(value: Counter1()),
      ],
          child: MaterialApp (
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Montserrat'),
          home:Scaffold(
              body:
                Container(
                  color: Colors.red,
                  child: Center(
                    child: Container(
                        child:
                        Indicator(),
                      ),
                  ),
                )
            ),
         ),
    );
    }
}