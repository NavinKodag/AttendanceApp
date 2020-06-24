import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Montserrat',),
        home: Splash(),
    );
  }
}
class Splash extends StatefulWidget {
    @override
    SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
    Future checkFirstSeen() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool _seen = (prefs.getBool('seen') ?? false);

        if (_seen) {
        Navigator.of(context).pushReplacement(
             MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
        await prefs.setBool('seen', true);
        Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (context) => IntroScreen()));
        }
    }

    @override
    void initState() {
        super.initState();
        new Timer(new Duration(seconds: 2), () {
        checkFirstSeen();
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child:Image.asset('lib/assets/loading.gif')
        ),
        );
    }
}


class IntroScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final screenwidth=MediaQuery.of(context).size.width;
      final screenheight=MediaQuery.of(context).size.height;

        return Scaffold(
          backgroundColor: Colors.black,
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                  Container(
                    child: Text('Welcome to the Attendance App',
                      style: TextStyle(fontSize: screenheight*0.025,color: Colors.white),
                      ),
                    ),
                  SizedBox(height: screenheight*0.1,),
                  Container(
                    width: screenwidth*0.8,
                    child:Center(
                      child: Text('This is an app to calculate attendance \n with "fAnCy" animations,\n\nyou are a beta tester,\n\n\n"why would i need an Attendance App?",you ask.',
                      style: TextStyle(color:Colors.white, ),
                      textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: screenwidth*1.0,
                    child:Center(
                      child:Text("\n \nfuck you,thats why.",
                      style: TextStyle(color:Colors.white, ),
                      textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  SizedBox(height: screenheight*0.1,),
                  Container(
                    decoration: BoxDecoration(
                      color:Colors.green[600],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FlatButton(
                child: Text('Start',
                style: TextStyle(color: Colors.white),),
                onPressed: () {
                      Navigator.of(context).pushReplacement(
                           MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                ),
                  )
            ],
            ),
        ),
        );
    }
}