import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final phoneNumber = '';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calling App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Phone and sms Application',
            style:
                TextStyle(color: Colors.white, backgroundColor: Colors.black45),
          ),
        ),
        body: Center(
          child: Column(
            children: [
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
                  final text = 'sms:$phoneNumber';
                  if (await canLaunch(text)) {
                    await launch(text);
                  }
                },
                color: Colors.blue,
                child: Text("SMS"),
              ),
              const SizedBox(
                height: 5,
              ),
              MaterialButton(
                onPressed: () async {
                  final num = '9898989898';
                  // final num = 'tel:9898989898';

                  await FlutterPhoneDirectCaller.callNumber(num);
                },
                color: Colors.blue,
                child: Text("Direct Call"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
