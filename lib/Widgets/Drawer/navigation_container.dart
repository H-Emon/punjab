import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationContainer extends StatelessWidget {
  final String titleText;
  final IconData icon;
  const NavigationContainer({
    required this.titleText,
    required this.icon,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){},
      child: Container(
        height:40,
        child:Column(
          children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Row(
                    children: [
                      Icon(icon, color:Colors.red[600],),
                      SizedBox(width:10,),
                      Text(titleText, style:TextStyle(
                        fontSize:16,
                        color:Colors.grey,
                        fontWeight:FontWeight.w400,

                      ),



                      )
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios_sharp, color:Colors.grey,size:20,)
              ],
            ),
            SizedBox(
             height:10,
            ),
            Divider(
              height:5,
              thickness:1,
              color:Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
