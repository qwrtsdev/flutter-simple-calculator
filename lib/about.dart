import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text('Pavich Komansil 6801012610111'),
            SizedBox(height: 12),
            Text('Nuttapong Nakawirot 6801012610260'),
            SizedBox(height: 12),
            Text('Made By GPT Team (GamePavichTechnologia)'),
            SizedBox(height: 20),
            Image.asset(
              'assets/test.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}