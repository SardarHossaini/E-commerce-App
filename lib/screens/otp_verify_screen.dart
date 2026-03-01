import 'package:flutter/material.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OtpVerifyScreen extends StatefulWidget {
  OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  // String? signature = await SmsVerification.getAppSignature();
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Enter OTP",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Please enter your number. You will receive a OTP code to create or set a new password via number.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              TextFieldPin(
                // textController: textEditingController,
                autoFocus: true,
                codeLength: 6,
                alignment: MainAxisAlignment.center,
                defaultBoxSize: 45.0,
                margin: 9,
                selectedBoxSize: 45.0,
                textStyle: TextStyle(fontSize: 16),
                // defaultDecoration: _pinPutDecoration.copyWith(
                // border: Border.all(
                // color: Theme.of(context)
                // .primaryColor
                //     .withOpacity(0.6))),
                // selectedDecoration: _pinPutDecoration,
                onChange: (code) {
                  // _onOtpCallBack(code,false);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => OtpVerifyScreen()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(55),
                  backgroundColor: Color(0xFFDB3022),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("Send code", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
