import 'package:calc03/calc.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width:  MediaQuery.of(context).size.width * 0.19,
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Calc()));
          }, child: Icon(Icons.calculate_rounded),
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue[200]),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.16,)
        )   )
      )
          ),
        ),
      ),
    );
  }
}