import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget{
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String FinalResult='';
  String result='';
  String ope='';

  double num1=0.0;
  double num2=0.0;
  ButtonPressed(String btntxt){
    if(btntxt=='AC'){
      FinalResult='';
      num1=0.0;
      num2=0.0;
      ope='';


    }
    else if(btntxt=='+' ||btntxt=='/'||btntxt=='-'||btntxt=='x'){
      num1=double.parse(result);
      FinalResult='';
      ope=btntxt;
      result=result+btntxt;

    }else if(btntxt=='.'){
      if(FinalResult.contains('.')){

      }else{
        FinalResult=FinalResult+btntxt;
      }

    }
    else if(btntxt=='+/-') {
      if (result.toString().contains('-')) {
        result.toString().substring(1);
        FinalResult=result;
      } else {
        result = '-' + result;
        FinalResult = result;
      }
    }else if(btntxt=='%'){
      num2=double.parse(result);
      FinalResult=(num2/100).toString();
    }
    else if(btntxt== '='){
      num2=double.parse(result);
      if(ope=='+'){
        FinalResult=(num1+num2).toString();
      }
       if(ope=='-'){
        FinalResult=(num1-num2).toString();
      }
      if(ope=='/'){
        FinalResult=(num1/num2).toString();
      }
       if(ope=='x'){
        FinalResult=(num1*num2).toString();
      }


    }
    else{
      FinalResult=FinalResult+btntxt;

    }
    setState(() {
      result=double.parse(FinalResult).toString();
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:  Row(
          children: [
            Text(
              'Calculator ',
              style:TextStyle(
                fontSize: 30,
                color: Colors.black
              ),


            ),
            Expanded(
              child: Text(
                'Copy From Eng / Mohamed Morsy ',
                style:Theme.of(context).textTheme.caption!.copyWith(
                 color: Colors.white
                )
              ),
            ),

          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    '${FinalResult}',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white
                    ),
                    maxLines: 1,
                    overflow:TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildButton(
                      title: 'AC',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,
                  ),
                  BuildButton(
                      title: '+/-',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,
                  ),
                  BuildButton(
                      title: '%',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,
                  ),
                  BuildButton(
                      title: '/',
                      colortxt: Colors.indigo,
                      backgroundtxt: Colors.white,
                  ),

                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildButton(
                      title: '7',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,
                  ),
                  BuildButton(
                      title: '8',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,

                  ),
                  BuildButton(
                      title: '9',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,
                  ),
                  BuildButton(
                      title: 'x',
                      colortxt: Colors.indigo,
                      backgroundtxt: Colors.white,
                  ),

                ],
              ),
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildButton(
                      title: '4',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,
                  ),
                  BuildButton(
                      title: '5',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,
                  ),
                  BuildButton(
                      title: '6',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,
                  ),
                  BuildButton(
                      title: '-',
                      colortxt: Colors.indigo,
                      backgroundtxt: Colors.white,
                  ),

                ],
              ),
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildButton(
                      title: '1',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,
                  ),
                  BuildButton(
                      title: '2',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,
                  ),
                  BuildButton(
                      title: '3',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,
                  ),
                  BuildButton(
                      title: '+',
                      colortxt: Colors.indigo,
                      backgroundtxt: Colors.white,
                  ),

                ],
              ),
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildZero(
                      title: '0',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,
                  ),
                  BuildButton(
                      title: '.',
                      colortxt: Colors.white,
                      backgroundtxt: Colors.indigo,
                  ),
                  BuildButton(
                      title: '=',
                      colortxt: Colors.indigo,
                      backgroundtxt: Colors.white,
                  ),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget BuildButton(
      {
        required String title,
        required Color colortxt,
        required Color backgroundtxt,

      }
      ){
    return     Container(
      child: RawMaterialButton(
          onPressed: (){
            ButtonPressed(title);
          },
          fillColor: backgroundtxt,
          shape:CircleBorder(),
          padding: EdgeInsets.all(10),
          child:Text(
            title,
            style: TextStyle(
                fontSize:35,
                color: colortxt
            ),
          )

      ),
    );

  }

  Widget BuildZero(
      {
        required String title,
        required Color colortxt,
        required Color backgroundtxt,


      }
      ){
    return     Container(
      child: RawMaterialButton(
          onPressed: (){
            ButtonPressed(title);

          },
          fillColor: backgroundtxt,
          shape:StadiumBorder(),
          padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
          child:Text(
            title,
            style: TextStyle(
                fontSize:35,
                color: colortxt
            ),
          )

      ),
    );

  }
}