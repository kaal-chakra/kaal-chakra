import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:solution_challenge/ui/screens/transaction_loading_screen.dart';

class PinInputScreen extends StatefulWidget {
  final String heading;
  final int length;
  final IconData? iconData;

  const PinInputScreen({
    Key? key,
    required this.heading,
    required this.length,
    this.iconData,
  }) : super(key: key);

  @override
  State<PinInputScreen> createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  late TextEditingController newTextEditingController;
  late FocusNode focusNode;
  String pin = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            (widget.iconData != null)
                ? Padding(
                    padding: const EdgeInsets.only(top: 75),
                    child: Icon(
                      widget.iconData,
                      size: 75,
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 25,
            ),
            Text(
              widget.heading,
              style: const TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Pinput(
                length: widget.length,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransactionLoadingScreen(
                        heading:
                            "Thank you for your generosity towards a better future!"),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
