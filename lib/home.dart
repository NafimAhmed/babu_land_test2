


import 'dart:convert';

//import 'package:babu_land_test/page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'page2.dart';

class Home extends StatefulWidget{



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map <String, dynamic>? apiMap;



  Map<String, String> get headers => {
    "MOBILE_NUMBER": "01717956094",
  };

  Future getUserData() async
  {
    var response=await http.get(
        Uri.parse('http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_ms'),headers: headers
    );


    setState((){
      apiMap = jsonDecode(response.body);
    });
    //print(list?.length);
  }

  @override
  Widget build(BuildContext context) {


    getUserData();
    // TODO: implement build
    return apiMap!=null?Scaffold(

      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back,color: Colors.white,),
            SizedBox(width: 26.w,),
            Text("Tickets",style: GoogleFonts.inter(

              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 24.sp
            ),),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 140, 26),


      ),
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: apiMap!['items'].length,
                  itemBuilder:(BuildContext context, int index){

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  child: Container(

                    padding: EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color.fromARGB(255, 254, 151, 56),
                          width: 2.0,
                        ),
                        right:  BorderSide(
                          color: Color.fromARGB(255, 0, 174, 239),
                          width: 2.0,
                        ),
                        top:  BorderSide(
                          color: Color.fromARGB(255, 77, 184, 77),
                          width: 2.0,
                        ),
                        bottom:  BorderSide(
                          color: Color.fromARGB(255, 255, 0, 0),
                          width: 2.0,
                        ),
                      )
                    ),

                    child: Column(
                      children: [
                        Row(
                          children: [

                            Image.asset("assets/Group16.png",
                            width: 16.w,
                            ),



                            Column(
                              children: [


                                Text("This is your Entry Ticket",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                                ),
                                ),

                                SizedBox(height: 5,),

                                Text("Order ID: ${apiMap!['items'][index]['pk']}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),

                                SizedBox(height: 5,),

                                Text("Ticket Price: ${apiMap!['items'][index]['total']}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),



                              ],
                            ),


                            Image.asset("assets/qr2.png",
                              width: 16.w,
                            ),



                          ],
                        ),






                        SizedBox(height: 5,),


                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Container(
                            height: 35.sp,width:30.w ,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Color.fromARGB(255, 255, 140, 43)
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                shadowColor: MaterialStateProperty.all(Colors.transparent),
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              onPressed: (){


                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Page2(
                                              orderID: "${apiMap!['items'][index]['pk']}",
                                              parchaseDate: "${apiMap!['items'][index]['sell_date']}",
                                              price: "${apiMap!['items'][index]['total']}",
                                            )
                                    )
                                );







                              },
                              child: Text('Active',
                                style: TextStyle(
                                    fontSize: 20,color: Colors.white),),
                            ),
                          ),
                        ),


                        SizedBox(height: 25,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(" Purchase Date  ${apiMap!['items'][index]['sell_date']}",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                            ),

                            Row(
                              children: [
                                Text("Detail",

                                  style: GoogleFonts.poppins(
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 248, 155, 46),
                                  ),

                                ),

                                SizedBox(width: 5,),
                                CircleAvatar(
                                  backgroundColor: Color.fromARGB(255, 248, 155, 46),
                                  radius: 9.5,
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                )
                              ],
                            )



                          ],
                        ),





                      ],
                    ),

                  ),
                );

              }
              ),

            ],
          ),
        ),
      ),
    ):Scaffold(
        body: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.orangeAccent,
            size: 100,
          ),


          ),
        );
  }




  @override
  void initState() {

    getUserData();
    // TODO: implement initState
    super.initState();
  }



}