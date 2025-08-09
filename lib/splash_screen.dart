import 'package:flutter/material.dart';
import 'package:project_1/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  
  State<Splash> createState() => _SplashState();

  
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Center image
          Center(child: Image.asset('image/splash_robo.png')),

          // Texts at the bottom
          Container(
            child: Positioned(
              bottom: 200,
              child: Column(
                children: [
                  Text(
                    "HALF WAY TO THE END",
                    style: const TextStyle(
                      fontFamily: 'Nosifer', // ✅ from pubspec.yaml
                      color: Color.fromARGB(255, 248, 27, 11),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        "The complete",
                        style: TextStyle(color: Colors.white, fontSize: 15, fontFamily:'Nosifer' ),
                      ),
                      const Text(
                        " AI",
                        style: TextStyle(color: Colors.red, fontSize: 15, fontFamily:'Nosifer' ),
                      ),
                      const Text(
                        " dominance",
                        style: TextStyle(color: Colors.white, fontSize: 15, fontFamily:'Nosifer' ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
