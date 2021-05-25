import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'Welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      // upperBound: 100.0, When using the CurvedAnimation class, then the upperBound property should not be used.
      vsync: this, // Here 'this' refers to the class _WelcomeScreenState.
    );

    // animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(
        controller); // This animation type is used to add a color transition type animation.

    controller.forward();
    // controller.reverse(
    //     from:
    //         1.0); // We you want you animation to grow from large to small i.e. in opposite or reverse order.

    // controller.addStatusListener((status) {
    //   // If we want to loop over our animation i.e. the animation should grow large and then small and then again large and so on =>
    //   if (status == AnimationStatus.completed) {
    //     // When the forward() animation is completed, then the value of status parameter is equal to AnimationStatus.completed.
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     // When the reverse() animation is completed, then the value of status parameter is equal to AnimationStatus.dismissed.
    //     controller.forward();
    //   }
    //   // print(status);
    // }); // This method tells you the status for both the forward and reverse animation. It updates the parameter status with a value when the animation is successfully completed.

    controller.addListener(() {
      setState(() {
        print(animation.value);
      });
    });
    // print(controller.value);
  }

  // Whenever you are using the AnimationController() widget then you must override the dispose() method and call the dispose method by using the object field (here: controller) so that after the page is disposed the animation also gets disposed and don't hog/occupy all the resources
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
