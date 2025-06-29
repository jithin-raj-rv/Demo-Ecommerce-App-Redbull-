import 'package:flutter/material.dart';
import 'package:quantupi/quantupi.dart';

class Upi extends StatelessWidget {
  const Upi({super.key,required this.amount});
  final double amount;
  @override
  Widget build(BuildContext context) {
    void payment() async {
      try {
        Quantupi upi = Quantupi(
          receiverUpiId: "9539223697@okbizaxis",
          receiverName: "Jithin Raj",
          transactionNote: "Pay to buy Redbull",
          amount: amount,
        );

        final response = await upi.startTransaction();

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Transaction Response"),
              content: Text(response),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text("An error occurred: $e"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }

    return 
      Dialog(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(),color: Color(0xFFC0C0C0)),
          child: Center(
            child: GestureDetector(
              onTap: () {
                payment();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("PhonePay,Gpay,Upi...."),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Pay ₹$amount")),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    
  }
}
