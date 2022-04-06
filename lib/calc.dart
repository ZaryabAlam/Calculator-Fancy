import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'home.dart';

class Calc extends StatefulWidget {
  const Calc({ Key? key }) : super(key: key);

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  var tex = "";
  var result = "";
  clr(){
    setState(() {
      result="";
    });
  }

   output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }


  Widget btn1(var tex){
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width:  MediaQuery.of(context).size.width * 0.16,
      child: ElevatedButton(onPressed: (){
        setState(() {
          result=result+tex;
        });
      }, child: Text(tex),style: 
      ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black26),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.16,)
        ))
      ),),
    );
  }

Widget spc(){
  return SizedBox(height: MediaQuery.of(context).size.height * 0.06);
}
////////////////////////////////////////////////////////////////////////
///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.123,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Column(
            children: [            
              Container(         
            height: MediaQuery.of(context).size.height * 0.12,
            width:  MediaQuery.of(context).size.width * 0.80,    
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(35),
            color: Colors.black12),
            padding: EdgeInsets.only(top: 20),
            child: Text(result,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40),
            ),
          ),      ],    )
          ),

          Positioned(
             top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.709,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.16,
              width:  MediaQuery.of(context).size.width * 0.21,
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(100),
            color: Colors.white),
          ),),

         Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Column(
              children: [btn1("7"), spc() , btn1("4"),spc(), btn1("1"),spc(), btn1(".")],
            )
          ),
           Positioned(
             top: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.28,
             child: Column(
              children: [
                btn1("8"),spc(),btn1("5"),spc(),btn1("2"),spc(),btn1("0"),
              ],   )
         ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.52,
            child: Column(
              children: [
                btn1("9"),spc(),btn1("6"),spc(),btn1("3"),spc(),
              ]    ),
          ),    
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.75,
             child: Column(
              children: [
                btn1("/"),spc(),btn1("*"),spc(),btn1("-"),spc(),btn1("+"),
              ],   )
         ),

         Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.72,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.16,
              width:  MediaQuery.of(context).size.width * 0.21,
          child: ElevatedButton(onPressed: clr, 
          child: Icon(Icons.backspace),
          style: 
          ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange[300]),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.16,)
        )   )
      ),   ),
    )   ),

    Positioned(
            top: MediaQuery.of(context).size.height * 0.84,
            left: MediaQuery.of(context).size.width * 0.52,
            child: Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width:  MediaQuery.of(context).size.width * 0.16,
      child: ElevatedButton(onPressed: output, child: Text("="),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green[300]),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.16,)
        )   )
      ), 
      
        ),
    )   ),  

    Positioned(
      top: MediaQuery.of(context).size.height * 0.03,
      left: MediaQuery.of(context).size.width * 0.05,
            child: Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width:  MediaQuery.of(context).size.width * 0.09,
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
          }, 
          child: Text("<"),
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue[200]),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.16,)
        )   )
      ),
          ),
        ))
          ]    ),
    );
  }
}