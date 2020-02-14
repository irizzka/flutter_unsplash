import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {

  final String url;
  AboutScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Image.network(url, height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width, fit: BoxFit.cover,),
      ),
    );
  }
}
