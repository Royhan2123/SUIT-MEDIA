import 'package:flutter/material.dart';
import 'package:suit_media1/third_screen.dart';

class SecondScreen extends StatefulWidget {
  final String? userName;
  final String selectedUsername;

  const SecondScreen({
    this.userName,
    required this.selectedUsername,
    Key? key,
  }) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedUserName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Second Screen",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(
              widget.userName ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                widget.selectedUsername.isNotEmpty
                    ? widget.selectedUsername
                    : "Selected User Name",
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ThirdScreen(),
            ),
          );

          if (result != null && result is Map<String, dynamic>) {
            setState(() {
              selectedUserName = result['selectedUsername'] ?? "";
            });
          }
        },
        child: const Text(
          "Choose a User",
          style: TextStyle(color: Colors.white),
        ),
      )
          ],
        ),
      ),
    );
  }
}