import 'dart:async';
import 'package:mastra_music/import.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double iconOpacity = 0.0;
  double textOpacity = 0.0;
  double loadingbarOpacity = 0.0;

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      setState(() {
        iconOpacity = 1.0;
      });
    });

    Timer(const Duration(seconds: 3), () {
      setState(() {
        textOpacity = 1.0;
      });
    });
    Timer(const Duration(seconds: 5), () {
      setState(() {
        loadingbarOpacity = 1.0;
      });
    });
    // After loading is complete

    Timer(const Duration(seconds: 9), () {
      Get.to(SplashScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 200,),
            AnimatedOpacity(
              opacity: iconOpacity,
              duration: Duration(seconds: 1),
              child: ClipRect(
                child: Container( 
                  height: 250,
                  width: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/mastra_music.png"),
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   // height: 10,
            // ),
            AnimatedOpacity(
              opacity: textOpacity,
              duration: Duration(seconds: 1),
              child: Text("Good Music on your phone",
                  style: ThemeHelper.lightTheme.textTheme.titleMedium),
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedOpacity(
              opacity: loadingbarOpacity,
              duration: const Duration(seconds: 1),
              child: const SpinKitThreeBounce(
                color: Color.fromARGB(255, 202, 60, 227),
                size: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
