import 'package:flutter/material.dart';
import 'package:project_1/gamming_area.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Center image
          Center(child: Image.asset('image/home_robo.png')),

          // Texts at the bottom
          Container(
            child: Positioned(
              bottom: 50,
              child: Column(
                children: [
                  SizedBox(
                    // 3 circle and stone,paper etc.. image
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.amber,
                          backgroundImage: AssetImage("image/paper.png"),
                        ),
                        SizedBox(width: 15),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.amber,
                          foregroundImage: AssetImage("image/stone.png"),
                        ),
                        SizedBox(width: 15),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.amber,
                          backgroundImage: AssetImage("image/scissor.png"),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),
                  Text(
                    "YOU CAN CHALLENGE AI ",
                    style: const TextStyle(
                      fontFamily: 'Nosifer', // ✅ from pubspec.yaml
                      color: Color.fromARGB(255, 248, 27, 11),
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "BUT CAN'T ELIMINATE ",
                    style: const TextStyle(
                      fontFamily: 'Nosifer', // ✅ from pubspec.yaml
                      color: Color.fromARGB(255, 248, 27, 11),
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        "The complete",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Nosifer',
                        ),
                      ),
                      const Text(
                        " AI",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontFamily: 'Nosifer',
                        ),
                      ),
                      const Text(
                        " dominance",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Nosifer',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GammingArea()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ), // Rounded edges
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 130,
                        vertical: 15,
                      ), // Size
                      elevation: 8, // Shadow depth
                      shadowColor: Colors.redAccent, // Shadow glow color
                    ),
                    child: const Text(
                      "Play & Lose",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
