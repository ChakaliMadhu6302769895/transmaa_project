import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLogo = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showLogo = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!showLogo)
              AnimatedLorry(),
            if (showLogo)
              Column(
                children: [
                  ClipRect(
                    child: Image.asset('assets/Finalized_logo_TRANSMAA-removebg-preview.png'),
                  ),
                  Text(
                    'Moving every load, all day, every day.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50, // Adjust width as needed
                        child: Divider(
                          color: Colors.black,
                          thickness: 2, // Adjust thickness as needed
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.star,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      Container(
                        width: 50, // Adjust width as needed
                        child: Divider(
                          color: Colors.black,
                          thickness: 2, // Adjust thickness as needed
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class AnimatedLorry extends StatefulWidget {
  @override
  _AnimatedLorryState createState() => _AnimatedLorryState();
}

class _AnimatedLorryState extends State<AnimatedLorry> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: -200.0, end: MediaQuery.of(context).size.width),
      duration: const Duration(seconds: 3),
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: Image.asset(
            'assets/lorry-removebg-preview.png',
            width: 400,
            height: 400,
          ),
        );
      },
    );
  }
}
