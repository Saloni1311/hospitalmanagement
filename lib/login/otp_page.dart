import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> _controllers =
  List.generate(4, (index) => TextEditingController());

  void _verifyOtp() {
    String otp = _controllers.map((c) => c.text).join();
    if (otp.length == 4 && RegExp(r'^\d{4}$').hasMatch(otp)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP Verified: $otp')),
      );
      // Navigate to dashboard or next screen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP')),
      );
    }
  }

  void _resendOtp() {
    // Add resend OTP logic here (API/Firebase)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP resent')),
    );
  }

  Widget _buildOtpField(int index) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: _controllers[index],
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter OTP',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                  SizedBox(height: 16),
                  Text('An OTP has been sent to your registered mobile/email.'),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) => _buildOtpField(index)),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _verifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      minimumSize: Size(double.infinity, 48),
                    ),
                    child: Text(
                      'Verify OTP',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: _resendOtp,
                    child: Text('Resend OTP'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
