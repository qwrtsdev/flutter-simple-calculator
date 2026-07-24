import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('นัทธพงศ์ นาคะวิโรจน์ 6801012610260', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('ภาวิช กอหมั่นศิลป์ 6801012610111', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}