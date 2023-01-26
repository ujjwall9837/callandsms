import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class SmsPage extends StatefulWidget {
  const SmsPage({super.key});

  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  TextEditingController phoneNumberController = new TextEditingController();

  String phoneNumber = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Box'),
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
              final text = 'sms:$phoneNumber';
              if (await canLaunch(text)) {
                await launch(text);
              }
            },
            color: Colors.blue,
            child: Text("SMS"),
          ),
        ],
      )),
    );
  }
}
