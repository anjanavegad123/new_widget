import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayDemo extends StatefulWidget {
  const RazorPayDemo({Key? key}) : super(key: key);

  @override
  State<RazorPayDemo> createState() => _RazorPayDemoState();
}

class _RazorPayDemoState extends State<RazorPayDemo> {
  ///razorpay_flutter: package mukvanu.....
  ///Razor_pay ni key....rzp_test_4Y7Nhiv0EAzD3m
  Razorpay razorpay = Razorpay();

  @override
  void initState() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Success");
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Successfully Done")));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("ERROR");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    print("WALLET");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              var options = {
                'key': 'rzp_test_4Y7Nhiv0EAzD3m',
                'amount': 100,
                'name': 'Acme Corp.',
                'description': 'Fine T-Shirt',
                'prefill': {
                  'contact': '8888888888',
                  'email': 'test@razorpay.com'
                }
              };
              razorpay.open(options);
            },
            child: Text("PAY")),
      ),
    );
  }
}
