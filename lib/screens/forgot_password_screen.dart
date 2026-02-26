import 'package:e_commerce_app/screens/otp_screen.dart';
import 'package:e_commerce_app/screens/recovery_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool clrButton = false;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, foregroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Forgot password",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Please enter your email address. You will receive a link to create or set a new password via email.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                onChanged: (val) {
                  if (val != "") {
                    setState(() {
                      clrButton = true;
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        emailController.clear();
                      });
                    },
                    child: Icon(CupertinoIcons.multiply, color: Color(0xFFDB3022)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RecoveryScreen()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(55),
                  backgroundColor: Color(0xFFDB3022),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("Send code", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              SizedBox(height: 25),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("OR", style: TextStyle(color: Colors.black54, fontSize: 15)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => OTPScreen()));
                    },
                    child: Text(
                      "Verify Using Number",
                      style: TextStyle(color: Color(0xFFDB3022), fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
