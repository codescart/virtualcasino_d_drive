import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upi_india/upi_india.dart';
import 'package:virtualcasino/constant/apihelper.dart';
import 'package:virtualcasino/customappbar/customappbar.dart';

class addcash extends StatefulWidget {
  @override
  _addcashState createState() => _addcashState();
}

class _addcashState extends State<addcash> {
  final amoount = TextEditingController();
  Future<UpiResponse>? _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  var coins='0';

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app, {required String amount}) async {
    // final prefs1 = await SharedPreferences
    //     .getInstance();
    // final key1 = 'amount';
    // final mobile = amount ;
    // prefs1.setString(key1, mobile);

    var long2 = double.parse(amount);
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "merchant966328.augp@aubank",
      receiverName: 'M-Matka',
      transactionRefId: 'Razorpay0256',
      transactionNote: 'Money Matka',
      amount: long2,
    );
  }

  Widget displayUpiApps() {
    if (apps == null)
      return Center(child: CircularProgressIndicator());
    else if (apps!.length == 0)
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    else
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _transaction = initiateTransaction(app, amount:amoount.text);
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      Text(app.name,style:GoogleFonts.playfairDisplay( textStyle:TextStyle(
                          fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                      ),
                      ) ,),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'Please Enter Amount';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        // pank();
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
                body,
                style: value,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: Colors.transparent,

        body: Container(

          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/home/adorn_gift.png'),
                fit: BoxFit.fill,
              )
          ),
          child: Container(
            height: MediaQuery.of(context).size.height*0.70,
            width: MediaQuery.of(context).size.width*0.40,
            // color: Colors.grey.withOpacity(0.5),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.yellow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              'Enter Amount',
                              style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                  fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
                              ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            width: 100,
                            alignment: Alignment.center,
                            child: TextFormField(
                              style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                  fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white
                              ),
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:Colors.white,
                                  ),
                                ),
                                hintText: "00",
                                hintStyle:GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white
                                ),
                                ),
                              ),
                              onChanged: (amoount){
                                setState(() {
                                  coins=amoount;
                                });
                              },
                              controller: amoount,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/home/coins.png",height: 20,width: 20,),
                              SizedBox(width: 5,),
                              Text("Coins : $coins",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                  fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xffFFD700)
                              ),
                              ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                  ),

                ),
                SizedBox(height: 20,),
                Container(
                  child: Center(child: Text("PAY USING", style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                      fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white
                  ),
                  ),
                  )
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: 150,
                  child: displayUpiApps(),
                ),
                FutureBuilder(
                  future: _transaction,
                  builder: (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            _upiErrorHandler(snapshot.error.runtimeType),
                            style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white
                            ),
                            ),
                          ), // Print's text message on screen
                        );
                      }

                      // If we have data then definitely we will have UpiResponse.
                      // It cannot be null
                      UpiResponse _upiResponse = snapshot.data!;

                      // Data in UpiResponse can be null. Check before printing
                      String txnId = _upiResponse.transactionId ?? 'N/A';
                      String resCode = _upiResponse.responseCode ?? 'N/A';
                      String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                      String status = _upiResponse.status ?? 'N/A';
                      String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                      _checkTxnStatus(status);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            displayTransactionData('Transaction Id', txnId),
                            displayTransactionData('Response Code', resCode),
                            displayTransactionData('Reference Id', txnRef),
                            displayTransactionData('Status', status.toUpperCase()),
                            displayTransactionData('Approval No', approvalRef),
                          ],
                        ),
                      );
                    } else
                      return Center(
                        child: Text(''),
                      );
                  },
                ),

              ],
            ),
          ),
            )
      ),
    );

  }
  // pank() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'user_id';
  //   final value = prefs.getString(key) ?? "0";
  //
  //   final prefs1 = await SharedPreferences.getInstance();
  //   final key1 = 'amount';
  //   final value1 = prefs1.getString(key1) ?? "0";
  //
  //   final response = await http.post(
  //     Uri.parse(
  //         Apiconst.baseurl+"payinuser"),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "user_id":"$value",
  //       "amount":"$value1"
  //     }),
  //   );
  //   final data = jsonDecode(response.body);
  //   print(data);
  //   if (data['error'] == 200) {
  //
  //
  //     Fluttertoast.showToast(
  //         msg: "Payment Add SucessFully",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     print("Payment Add SucessFully");
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => MainDashboardScreen()));
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: "Failed to add Balance",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }
  // }
}




