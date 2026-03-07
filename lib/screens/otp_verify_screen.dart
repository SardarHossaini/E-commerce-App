import 'dart:async';

import 'package:e_commerce_app/screens/recovery_screen.dart';
import 'package:flutter/material.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  static const Color _primaryColor = Color(0xFFDB3022);

  final TextEditingController _otpController = TextEditingController();
  Timer? _timer;
  int _secondsRemaining = 30;

  bool get _canVerify => _otpController.text.trim().length == 6;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: const Color(0xFFF4F6FA),
      border: Border.all(color: const Color(0xFFE4E7EC)),
    );
  }

  Future<void> _getSignatureCode() async {
    await SmsVerification.getAppSignature();
  }

  void _startResendTimer() {
    _timer?.cancel();
    _secondsRemaining = 30;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF1C2230),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFCEAE8), Color(0xFFFFF7F6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Verify code',
                      style: TextStyle(
                        color: Color(0xFF1C2230),
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enter the 6-digit code sent to your phone number to continue password recovery.',
                      style: TextStyle(color: Color(0xFF6C7484), fontSize: 14, height: 1.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4F2),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFFFD8D2)),
                ),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Color(0xFFFFE5E1),
                      child: Icon(Icons.sms_outlined, color: _primaryColor),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        'For your security, this code will expire soon. Please verify before requesting a new one.',
                        style: TextStyle(color: Color(0xFF6C7484), fontSize: 13, height: 1.45),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(color: Color(0x0D101828), blurRadius: 24, offset: Offset(0, 10)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'One-time password',
                      style: TextStyle(
                        color: Color(0xFF344054),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextFieldPin(
                      textController: _otpController,
                      autoFocus: true,
                      codeLength: 6,
                      alignment: MainAxisAlignment.spaceBetween,
                      defaultBoxSize: 46,
                      margin: 0,
                      selectedBoxSize: 46,
                      textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1C2230),
                      ),
                      defaultDecoration: _pinPutDecoration,
                      selectedDecoration: _pinPutDecoration.copyWith(
                        border: Border.all(color: _primaryColor, width: 1.5),
                      ),
                      onChange: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _secondsRemaining > 0
                              ? 'Resend available in 00:${_secondsRemaining.toString().padLeft(2, '0')}'
                              : 'Didn\'t receive the code?',
                          style: const TextStyle(color: Color(0xFF8D96A8), fontSize: 13),
                        ),
                        TextButton(
                          onPressed: _secondsRemaining > 0
                              ? null
                              : () {
                                  _otpController.clear();
                                  setState(() {});
                                  _getSignatureCode();
                                  _startResendTimer();
                                },
                          child: const Text(
                            'Resend',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ElevatedButton(
                      onPressed: !_canVerify
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const RecoveryScreen()),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(54),
                        backgroundColor: _primaryColor,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: const Color(0xFFFFD8D4),
                        disabledForegroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'Verify OTP',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE7ECF3)),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.verified_user_outlined, color: Color(0xFF12B76A)),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'We use one-time verification to protect your account from unauthorized access.',
                        style: TextStyle(color: Color(0xFF475467), fontSize: 13, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Wrong number? Go back and update your phone details.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF6C7484), fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
