import 'package:flutter/material.dart';
import 'package:salad/utils/list.dart';

class cartscreen extends StatefulWidget {
  const cartscreen({super.key});

  @override
  State<cartscreen> createState() => _cartscreenState();
}

class _cartscreenState extends State<cartscreen> {
  int Total=0;
  @override
  State<cartscreen> createState() => _cartscreenState();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade500,
          title: Text("Cart Screen "),
          actions: [

            InkWell(
                onTap:(){
                  Navigator.pop(context,'/');
                },
               child: Icon(Icons.close),
    ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: cartList.map((e) {
                    Total = Total + e['price'] as int ;
                    return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.15,
                      decoration: BoxDecoration(color: Colors.white60,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          Image.asset("${e['img']}", width: 80, height: 80,),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${e['name']}", style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text("${e['price']}", style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                cartList.remove(e);
                                Total=0;
                              });
                            },
                            child: Icon(Icons.delete_forever),),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(alignment: Alignment.bottomLeft,),
                Text("Total Quantity =  ${cartList.length}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                SizedBox(height: 10),
                Text("Total Price = \$ ${Total}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              ],
            )
          ],
        ),
      ),
    );
  }
}