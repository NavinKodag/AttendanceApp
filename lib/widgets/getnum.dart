import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:attendance_app/blocs/newcounters.dart';
import 'package:provider/provider.dart';
import 'package:attendance_app/widgets/animated_counter.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Indicator extends StatelessWidget{
  @override
  Widget build(BuildContext context){
  
  final screenheight=MediaQuery.of(context).size.height;
  
    final counter1 = Provider.of<Counter1>(context);
    
    return  Scaffold(
        
        backgroundColor: Colors.black,

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: GestureDetector(
                onLongPress: () => counter1.resetcounter(),
                
                  child: Container(
                  child: Center(
                    child: Container(
                    
                     
                    child:CircularPercentIndicator(
                  radius: 200.0,
                  lineWidth: 9.0,
                  animation: true,
                  animationDuration: 320,
                  animateFromLastPercent: true,
                  percent: counter1.percprog,
                  center: Text(counter1.perc.toString()+"%",
                  style: TextStyle(fontSize:50.0,color: Colors.white),),
                  progressColor: counter1.color,
                  backgroundColor: Colors.white,
                  circularStrokeCap: CircularStrokeCap.round,
                    )
                    
                       ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FlatButton(
                      onPressed:  () => counter1.decrementor1(),
                      child: Icon(Icons.remove,color: Colors.white),),
                    Container(
                       
                      padding: EdgeInsets.all(10),

                       decoration: BoxDecoration(
                         color:Color(0xFF4F4F4F),
                         borderRadius: BorderRadius.circular(14)
                       ),
                        child: Center(
                          child:AnimatedFlipCounter(
                     duration: Duration(milliseconds: 266),
                     value: counter1.counter1,
                     color: Colors.white,
                      size: screenheight*0.082,
                         ),
                       ),
                        ),
                    FlatButton(
                      onPressed:  () => counter1.incrementor1(),
                      child: Icon(Icons.add,color: Colors.white),),
                  Text('Total',
                    style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    FlatButton(
                        onPressed: () => counter1.decrementor2(),
                        child: Icon(Icons.remove,color: Colors.white),),
                    Container(
                      child: Center(
                        child: AnimatedFlipCounter(
                          duration: Duration(milliseconds: 266),
                          value: counter1.counter2, 
                          color: Colors.white,
                          size: screenheight*0.082,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:Color(0xFF4F4F4F),
                        borderRadius: BorderRadius.circular(14)
                      ),
                    ),
                    FlatButton(
                      onPressed: () => counter1.incrementor2(),
                      child: Icon(Icons.add,color: Colors.white,),
                      ),
                    Text('Attended',
                    style: TextStyle(fontSize: 20,
                    color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
           
          ],
        ),    
    );
  }
}