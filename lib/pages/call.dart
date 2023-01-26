import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  TextEditingController phoneNumberController = new TextEditingController();

  String phoneNumber = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calling'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: phoneNumberController,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Enter The Number"),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                onSubmitted: ((value) {
                  setState(() {
                    phoneNumber = phoneNumberController.text;
                  });
                }),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                final _call = 'tel:$phoneNumber';
                //
                if (await canLaunch(_call)) {
                  await launch(_call);
                }
              },
              color: Colors.blue,
              child: Text("CALL"),
            ),
            const SizedBox(
              height: 5,
            ),
            MaterialButton(
              onPressed: () async {
                // final num = '9898989898';
                // final num = 'tel:9898989898';

                await FlutterPhoneDirectCaller.callNumber(phoneNumber);
              },
              color: Colors.blue,
              child: Text("Direct Call"),
            ),
          ],
        ),
      ),
    );
  }
}
