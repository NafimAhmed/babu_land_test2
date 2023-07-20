


import 'dart:convert';

import 'package:babu_land_test2/util/underline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class Page2 extends StatefulWidget{

  final String orderID;
  final String parchaseDate;
  final String price;


  const Page2({super.key, required this.orderID, required this.parchaseDate, required this.price});



  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {


  Map <String, dynamic>? apiMap;



  Map<String, String> get headers => {
    "ORDER_ID": "${widget.orderID}",
  };

  Future getUserData() async
  {
    var response=await http.get(
        Uri.parse('http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_dt'),headers: headers
    );


    setState((){
      apiMap = jsonDecode(response.body);
    });
    //print(list?.length);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return apiMap!=null? Scaffold(
      appBar: AppBar(
        title: Text("My Tickets",
          style: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [


            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(


            colors: [
            Colors.white,
              Colors.red.shade100
          ],
          begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.0, 1.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),



                ),
              height: 60.h,
              child: ListView.builder(
                  shrinkWrap: true,

                  physics: ScrollPhysics(),
                  itemCount: apiMap!['items'].length,
                  itemBuilder:(BuildContext context, int index){

                    return Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent.shade100
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Container(
                            width: 2,
                            height: 160,
                            color: Colors.orange,
                          ),

                          Column(
                            children: [

                              Container(
                                width: 90.w,
                                height: 2,
                                //color: Colors.red,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60.w,
                                      height: 2,
                                      color: Colors.green,

                                    ),
                                    Container(
                                      width: 30.w,
                                      height: 2,
                                      color: Colors.red,

                                    )
                                  ],
                                ),
                              ),

                              Container(


                                child: Row(

                                  mainAxisAlignment: MainAxisAlignment.start,



                                  children: [

                                    Container(
                                      width:80,
                                      child: Column(
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset("assets/Group16.png"),
                                          SizedBox(height: 10,),
                                          Text("Uttara"),
                                         UnderLine(),
                                          Text("Wari"),
                                          UnderLine(),
                                          Text("Badda"),
                                          UnderLine(),
                                          Text("Mirpur"),
                                          UnderLine()
                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      width: 10,
                                    ),

                                    ////////////////////////////////////////////////////////


                                    Flex(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      direction: Axis.vertical,
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate((400/10).floor(), (index) =>Column(
                                        children: [
                                          SizedBox(
                                            width: 1,
                                            height: 2,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: Colors.white
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 1,
                                            height: 2,
                                          )
                                        ],
                                        //   SizedBox(
                                        // width: 1,
                                        // height: 3,
                                        // child: DecoratedBox(
                                        //
                                        //   decoration: BoxDecoration(
                                        //       color: Colors.white,
                                        //
                                        //   ),
                                        // ),

                                      ),),),


                                    SizedBox(
                                      width: 8.w,
                                    ),


                                    ///////////////////////////////////////////////////////////





                                    Column(
                                      children: [
                                        Text("${apiMap!['items'][index]['dsc']} Ticket",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),


                                        Text("SL NO : ${apiMap!['items'][index]['pk']}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            color: Colors.grey.shade600

                                          ),
                                        ),

                                        Text("Quantity : ${apiMap!['items'][index]['qty']}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            color: Colors.red
                                          ),
                                        ),

                                        SizedBox(height: 10,),

                                        Container(
                                         padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: Colors.green
                                          ),
                                          child: Text("Price : ${apiMap!['items'][index]['iteminfo_fk']}",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ),








                                      ],
                                    ),
                                  ],
                                ),

                              ),

                              Container(
                                width: 90.w,
                                height: 2,
                                //color: Colors.green,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30.w,
                                      height: 2,
                                      color: Colors.purple,

                                    ),
                                    Container(
                                      width: 60.w,
                                      height: 2,
                                      color: Colors.pink,

                                    )
                                  ],
                                ),
                              ),


                            ],
                          ),

                          Container(
                            width: 2,
                            height: 160,
                            color: Colors.blue,
                          ),

                        ],
                      ),
                    );

                  }
              ),
            ),



            Container(
              //alignment: Alignment.bottomCenter,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  Container(
                    height: 4,
                    width: 30.w,
                    color: Colors.orange,

                  ),

                  SizedBox(height: 10,),


                  Text("Scan QR code to avail ticket",

                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp
                    ),

                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Order Id: ",

                            style: GoogleFonts.openSans(
                              color: Colors.grey.shade600
                            ),

                          ),

                          Text("${widget.orderID}",
                            
                            style: GoogleFonts.openSans(
                              color: Color.fromARGB(255, 255, 140, 26)
                            ),
                          
                          ),

                          Text("Ticket Parchase Date: ",

                            style: GoogleFonts.openSans(
                                color: Colors.grey.shade600
                            ),


                          ),

                          Text("${widget.parchaseDate}",
                            style: GoogleFonts.openSans(
                                color: Color.fromARGB(255, 255, 140, 26)
                            ),
                          ),


                          Text("Ticket Expire Date: ",
                            style: GoogleFonts.openSans(
                                color: Colors.grey.shade600
                            ),

                          ),

                          Text("None",
                            style: GoogleFonts.openSans(
                                color: Color.fromARGB(255, 255, 140, 26)
                            ),
                          ),

                          Text("Ticket Price: ",
                            style: GoogleFonts.openSans(
                                color: Colors.grey.shade600
                            ),

                          ),

                          Text("${widget.price}",

                            style: GoogleFonts.openSans(
                                color: Color.fromARGB(255, 255, 140, 26)
                            ),

                          ),

                        ],
                      ),



                      QrImageView(
                        data: '${widget.orderID}',
                        version: QrVersions.auto,
                        size: 35.w,
                      ),



                    ],
                  ),

                  SizedBox(height: 10,),

                  Container(
                    height: 4,
                    width: 40.w,
                    color: Colors.black,

                  ),
                ],
              ),
            ),







          ],
        ),
      ),
    ):Scaffold(
        body: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.orangeAccent,
            size: 100,
          ),
        )
    );
  }



  @override
  void initState() {

    getUserData();
    // TODO: implement initState
    super.initState();
  }




}