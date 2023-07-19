


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("My Tickets",
          style: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700
          ),
        ),

      ),
      body: Column(
        children: [


          Container(
            height: 60.h,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: apiMap!['items'].length,
                itemBuilder:(BuildContext context, int index){

                  return Container(

                    child: Column(
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
                              fontWeight: FontWeight.w400
                          ),
                        ),

                        Text("Quantity : ${apiMap!['items'][index]['qty']}",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          ),
                        ),


                        Text("Price : ${apiMap!['items'][index]['iteminfo_fk']}",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          ),
                        ),








                      ],
                    ),

                  );

                }
            ),
          ),



          Container(
            //alignment: Alignment.bottomCenter,

            child: Column(
              children: [
                Text("Scan QR code to avail ticket",

                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp
                  ),

                ),
                Row(
                  children: [
                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Order Id: "),

                        Text("${widget.orderID}"),

                        Text("Ticket Parchase Date: "),

                        Text("${widget.parchaseDate}"),
                        Text("Ticket Expire Date: "),

                        Text("None"),

                        Text("Ticket Price: "),

                        Text("${widget.price}"),

                      ],
                    ),



                    QrImageView(
                      data: '${widget.orderID}',
                      version: QrVersions.auto,
                      size: 35.w,
                    ),



                  ],
                ),
              ],
            ),
          )



        ],
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