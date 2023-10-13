import 'package:flutter/material.dart';
import 'package:salad/utils/list.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String dropdownvalue = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          leading: Icon(Icons.location_on),
          title: Text("Habiganj City"),
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, 'cart');
                });
              },
              child: Icon(
                Icons.add_shopping_cart,
              ),
            )
          ],
          backgroundColor: Colors.green.shade500,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Find  The  ",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  Text(
                    "Best",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Food  ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Text(
                    "Around  you",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DropdownButton(
                    value: dropdownvalue,
                    isDense: true,
                    isExpanded: true,
                    menuMaxHeight: 350,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items:[
                      DropdownMenuItem(
                          child: Text("Select list") ,
                          value: ""),
                      ...drop.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(child: Text(e["name"]),value: e['value'],);
                      }).toList(),
                    ], onChanged: (value){
                  setState(() {
                    dropdownvalue = value!;
                    print("selectedCovervalue");

                  });
                }),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " Find ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " 5 km>",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 600,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Salads",
                            style: TextStyle(color: Colors.black, fontSize: 20)),
                        alignment: Alignment.center,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Hot sale",
                            style: TextStyle(color: Colors.black, fontSize: 20)),
                        alignment: Alignment.center,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Popularity",
                            style: TextStyle(color: Colors.black, fontSize: 20)),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 220,mainAxisSpacing:10,crossAxisSpacing: 10),
                  children:food.map((e) => InkWell(
                    onTap: (){
                      Navigator.pushNamed(context,'profile',arguments:e);
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.favorite_border,color: Colors.red,)),

                          Image.asset("${e['img']}", height: 100),
                          Text(
                            "${e['name']}",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),


                          Row(
                            children: [
                              Text(
                                "20 min",
                                style: TextStyle(color: Colors.black45),
                              ),
                              Spacer( ),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              Text(
                                "4.5",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Spacer( ),
                          Row(
                            children: [
                              Text(
                                "\$ ${e['price']}",
                                style: TextStyle(fontSize: 15),
                              ),
                              Spacer( ),
                              Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(2)),

                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),).toList(),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}