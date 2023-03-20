import 'package:flutter/material.dart';
class Nothing_To_Do extends StatelessWidget {
  const Nothing_To_Do({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 1.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('Assets/Group_141.png'),width: 300,),
          SizedBox(
            height: 10,
          ),

          Text("All Done For Now",
            style: TextStyle(
                color:Colors.indigoAccent,
                fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Time For A Break",
            style: TextStyle(
                fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
