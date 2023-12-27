import 'package:flutter/material.dart';
import 'package:suit_media1/second_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController txtName = TextEditingController(text: "");
    final TextEditingController txtPalindrome = TextEditingController(text: "");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/ic_photo.png",
              width: 116,
              height: 116,
              fit: BoxFit.cover,
              color: Colors.grey,
            ),
            Container(
              width: 310,
              height: 47,
              margin: const EdgeInsets.only(top: 51, bottom: 15),
              child: TextFormField(
                controller: txtName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Name",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
            ),
            Container(
              width: 310,
              height: 47,
              margin: const EdgeInsets.only(bottom: 45),
              child: TextFormField(
                controller: txtPalindrome,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Palindrome",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(310, 41),
                backgroundColor: const Color(0xff2B637B),
                foregroundColor: Colors.lightBlue,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text(
                "CHECK",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(310, 41),
                backgroundColor: const Color(0xff2B637B),
                foregroundColor: Colors.lightBlue,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondScreen(),
                  ),
                );
              },
              child: Text(
                "NEXT",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
