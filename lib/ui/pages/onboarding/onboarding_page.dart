// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pic_2_plate_ai/ui/app_router.dart';
import 'package:pic_2_plate_ai/ui/pages/meal_creation/meal_creation_page.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                    height: 95.0,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xff0b6c4a),
                    child: Column(
                      children: [
                        Row(
                          children:<Widget>[
                            Expanded(
                              flex: 7,
                              child: Column(
                                children: [

                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 25, left: 10),
                                      child: Text("Selamat Pagi,",
                                        style: TextStyle(
                                            fontSize: 16,
                                            decoration: TextDecoration.none,
                                            color : Colors.white),
                                            ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child:
                                    Padding(
                                      padding: EdgeInsets.only(left:10),
                                      child:Text("Christian Ferdinand", style: TextStyle(
                                          fontSize: 22,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                          color : Colors.white),) ,
                                    )

                                  )

                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Icon(Icons.favorite,
                                  size: 40,
                                ),
                              ),
                            )

                          ],
                        ),
                      ],
                    )


                )
            ), // NAVBAR ATAS END

            Container(
                margin: EdgeInsets.only(top: 15),
                child : Row(
                  children: [
                    //Start Kiri
                    Expanded(
                        flex:4,
                        child: Container(
                            margin: EdgeInsets.only(left:8.0, right: 8),
                            height: 120,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: [
                                    0.1,
                                    0.6,
                                    0.9,
                                  ],
                                  colors: [
                                    Color(0xff16722F),
                                    Color(0xff27a14f),
                                    Color(0xff0B841D),
                                  ],),
                                borderRadius: BorderRadius.circular(40)),
                            child : Column(
                              children: [

                                Container(
                                  child:
                                  Row( children: [
                                    Expanded(
                                      flex:5,
                                      child:
                                      Container(
                                        margin: EdgeInsets.only(left: 2,top: 10),
                                      child: Icon(Icons.data_thresholding, size: 40,
                                          color: Colors.white)),
                                    ),

                                  Expanded(
                                    flex:5,
                                    child:
                                    Container(
                                      margin: EdgeInsets.only(left: 30,top: 10),
                                    child: Icon(Icons.arrow_upward, size: 18,
                                        color: Colors.white),
                                    ),)
                                  ],

                               )
                                ),

                                Container(
                                  margin: EdgeInsets.only(right:15,top: 15),
                                  child: Text("Rp. 500.000,",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                      fontSize : 20,
                                    color: Colors.white
                                  ),),
                                ),

                                Align(
                                  alignment: AlignmentDirectional.bottomStart,
                                  child:  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("Total Savings", style: TextStyle(
                                      fontSize: 12,
                                        color: Colors.white
                                    ),),
                                  ) ,
                                )





                              ],
                            )
                        ) ),
// End Kanan
                    Expanded(
                        flex:4,
                        child: Container(
                            margin: EdgeInsets.only(left:8.0, right: 8),
                            height: 120,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: [
                                    0.1,
                                    0.6,
                                    0.9,
                                  ],
                                  colors: [
                                    Color(0xff16722F),
                                    Color(0xff27a14f),
                                    Color(0xff0B841D),
                                  ],),
                            borderRadius: BorderRadius.circular(40)),
                            child : Column(
                              children: [
                                Container(
                                    child:
                                    Row( children: [
                                      Expanded(
                                        flex:5,
                                        child:
                                        Container(
                                            margin: EdgeInsets.only(left: 2,top: 10),
                                            child: Icon(Icons.access_time_outlined, size: 40,
                                            color: Colors.white,)),
                                      ),

                                      Expanded(
                                        flex:5,
                                        child:
                                        Container(
                                          margin: EdgeInsets.only(left: 30,top: 10),
                                          child: Icon(Icons.arrow_upward, size: 18,
                                          color: Colors.white,),
                                        ),)
                                    ],

                                    )
                                ),

                                Container(
                                  margin: EdgeInsets.only(right:15,top: 15),
                                  child: Text("2h 50m",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize : 20,
                                        color: Colors.white
                                    ),),
                                ),

                                Align(
                                  alignment: AlignmentDirectional.bottomStart,
                                  child:  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("Average App Usage", style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white
                                    ),),
                                  ) ,
                                )

                              ],
                            )
                        ) ),
                  ],
                )
            ) ,
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      width: 0.2,
                      height: 120,
                    )),

                Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [
                            0.1,
                            0.4,
                            0.6,
                            0.9,
                          ],
                          colors: [
                            Color(0xff16722F),
                            Color(0xff3ADD70),
                            Color(0xff4A7555),
                            Color(0xff0B841D),
                          ],),
                        borderRadius: BorderRadius.circular(40.0), // Adjust the radius as needed
                      ),
                      width: 0.2,
                      margin: EdgeInsets.only(top: 15),
                      height: 120,
                      child: Row(
                        children: [
                          Expanded(
                              child: Align(
                                  alignment: AlignmentDirectional.bottomStart,
                                  child:
                                  Container(
                                    margin: EdgeInsets.only(left: 20, bottom: 25),
                                    child: Text("Leaderboard",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),),
                                  )
                              )
                          ),

                          Expanded(child:

                          Container(
                            margin: EdgeInsets.only(right:15,top: 55),
                            child: Align(
                              alignment : AlignmentDirectional.bottomEnd,
                              child : Column(
                                children: [

                                  Align(
                                    alignment : AlignmentDirectional.bottomEnd,
                                    child: Text("No. 4",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize : 20,
                                          color: Colors.white
                                      ),),
                                  ),

                                  Align(
                                    alignment : AlignmentDirectional.bottomEnd,
                                    child: Text("3 more donation for No. 3",
                                      style: TextStyle(
                                          fontSize : 8,
                                          color: Colors.white
                                      ),),
                                  )

                                ],
                              )
                            )


                          ),


                              )




                        ],
                      ),

                    )),

                Expanded(
                    flex: 1,
                    child: Container(
                      width: 0.2,
                      height: 120,

                    ))


              ],
            )// End Container Row Saving
            ,
            Align(
              alignment: AlignmentDirectional.topStart,
              child:  Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Text("Aktivitas Kamu",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none
                  ),),
              ) ,
            ),

            Row(
              children: [


                Expanded(
                    flex: 9,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [
                              0.1,
                              0.6,
                              0.9,
                            ],
                            colors: [
                              Color(0xff16722F),
                              Color(0xff27a14f),
                              Color(0xff26bc3b),
                            ],),
                          borderRadius: BorderRadius.circular(40)),
                      width: 0.2,
                      margin: EdgeInsets.only(top: 5, left:20,right: 20),
                      height: 170,
                      child: Row(
                        children: [


                        ],
                      ),

                    )),

              ],
            )// End



          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFF6E9B2),
        unselectedItemColor: Color(0xff0A6847),
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Mindful Pantry',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Food Rescue',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/meal-creation');
              break;
            case 2:
              Navigator.pushNamed(context, '/peran');
              break;
            case 3:
              Navigator.pushNamed(context, '/arian');
              break;
          }
        },
      ),
    );
  }
}