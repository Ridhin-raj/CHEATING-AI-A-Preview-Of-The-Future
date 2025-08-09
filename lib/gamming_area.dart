import 'package:flutter/material.dart';
import 'dart:async';

class GammingArea extends StatefulWidget {
  const GammingArea({super.key});

  @override
  State<GammingArea> createState() => _GammingAreaState();
}

class _GammingAreaState extends State<GammingArea> {
  int userWins = 0;
  int aiWins = 0;
  String aiChoiceImage = "image/ai.avif"; // Default AI image

  // AI always wins logic
  void _userChoice(String choice) {
    if (choice == "stone") {
      aiChoiceImage = "image/paper.png"; // paper beats stone
    } else if (choice == "paper") {
      aiChoiceImage = "image/scissor.png"; // scissor beats paper
    } else {
      aiChoiceImage = "image/stone.png"; // stone beats scissor
    }

    setState(() {
      aiWins++; // only AI score increases
    });

    // Show popup after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      _showDefeatPopup();
    });
  }

  void _showDefeatPopup() {
    showDialog(
      context: context,
      barrierDismissible: false, // user can't close by tapping outside
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            "AI Says:",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            "I told you... you can't even think of winning against AI.\nAccept it and get off!",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close popup
              },
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        "IF YOU WANT JUST GIVE A TRY OTHERWISE ACCEPT THE DEFEAT TO THE AI AND GO OFF",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontFamily: "fonts/Nosifer-Regular.ttf",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 200,
                width: 350,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("image/user.png"),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 250,
                      width: 150,
                    ),
                    const SizedBox(width: 50, height: 150),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(aiChoiceImage), // Show AI's choice
                          fit: BoxFit.fill,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 250,
                      width: 150,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 150,
                width: 350,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const Text(
                      "choose any one",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _userChoice("stone"),
                          child: const CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage("image/stone.png"),
                          ),
                        ),
                        const SizedBox(width: 30),
                        GestureDetector(
                          onTap: () => _userChoice("paper"),
                          child: const CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage("image/paper.png"),
                          ),
                        ),
                        const SizedBox(width: 30),
                        GestureDetector(
                          onTap: () => _userChoice("scissor"),
                          child: const CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage("image/scissor.png"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                        "User Wins",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "$userWins",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 100),
                  Column(
                    children: [
                      const Text(
                        "Ai Wins",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "$aiWins",
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
