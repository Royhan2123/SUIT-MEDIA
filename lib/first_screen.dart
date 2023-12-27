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
      body: Container(
        decoration: const BoxDecoration(
          // Apply the gradient to the Container's decoration
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xFF325F8B),
              Color(0xFF336C8D),
              Color(0xFF5993A4),
              Color(0xFF839EA9),
            ],
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 116,
                height: 116,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 235, 235, 235)),
                child: const Icon(
                  Icons.person_add_alt_1,
                  color: Colors.white,
                  size: 40,
                ),
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
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Name",
                    hintStyle: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 206, 205, 205),
                    ),
                    contentPadding: const EdgeInsets.only(left: 20),
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
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Palindrome",
                    hintStyle: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 206, 205, 205),
                    ),
                    contentPadding: const EdgeInsets.only(left: 20),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(310, 41),
                  backgroundColor: const Color.fromARGB(255, 34, 78, 97),
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
                  backgroundColor: const Color.fromARGB(255, 34, 78, 97),
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
      ),
    );
  }
}
