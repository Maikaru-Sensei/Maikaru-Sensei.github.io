import 'package:flutter/material.dart';

class PageMeIntro extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.green,
                  width: 3.0,
                ),
              ),
              child: const CircleAvatar(
                radius: 50, // Adjust the radius as needed
                backgroundImage: AssetImage('assets/me.jpg'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Hi ✌️ I\'m Michael and I ❤️ Mobile App Development',
              style: TextStyle(color: Colors.white),
            )
          ],
        ));
  }
}
