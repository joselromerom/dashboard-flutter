import 'dart:math';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:flutter/material.dart';

class AnimationWait extends StatefulWidget {
  const AnimationWait({Key key}) : super(key: key);

  @override
  _AnimationWaitState createState() => _AnimationWaitState();
}

class _AnimationWaitState extends State<AnimationWait> with TickerProviderStateMixin {
  AnimationController firstController;
  Animation<double> firstAnimation;

  AnimationController secondController;
  Animation<double> secondAnimation;

  AnimationController thirdController;
  Animation<double> thirdAnimation;

  AnimationController fourthController;
  Animation<double> fourthAnimation;

  AnimationController fifthController;
  Animation<double> fifthAnimation;

  @override
  void initState() {
    super.initState();

    firstController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    firstAnimation = Tween<double>(begin: -pi, end: pi).animate(firstController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    secondAnimation = Tween<double>(begin: -pi, end: pi).animate(secondController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    thirdController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    thirdAnimation = Tween<double>(begin: -pi, end: pi).animate(thirdController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourthController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    fourthAnimation = Tween<double>(begin: -pi, end: pi).animate(fourthController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          fourthController.forward();
        }
      });

    fifthController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    fifthAnimation = Tween<double>(begin: -pi, end: pi).animate(fifthController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fifthController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          fifthController.forward();
        }
      });

    firstController.forward();
    secondController.forward();
    thirdController.forward();
    fourthController.forward();
    fifthController.forward();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    fifthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor == Colors.green[500]
          ? Colors.grey[800]
          : Theme.of(context).primaryColor == Colors.indigo[500]
              ? ArgonColors.white
              : Colors.purple[300],
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: CustomPaint(
            painter: MyPainter(
              firstAnimation.value,
              secondAnimation.value,
              thirdAnimation.value,
              fourthAnimation.value,
              fifthAnimation.value,
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double firstAngle;
  final double secondAngle;
  final double thirdAngle;
  final double fourthAngle;
  final double fifthAngle;

  MyPainter(
    this.firstAngle,
    this.secondAngle,
    this.thirdAngle,
    this.fourthAngle,
    this.fifthAngle,
  );

  @override
  void paint(Canvas canvas, Size size) {
    Paint myArc = Paint()
      ..color = ArgonColors.initial
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromLTRB(
        0,
        0,
        size.width,
        size.height,
      ),
      firstAngle,
      2,
      false,
      myArc,
    );
    canvas.drawArc(
      Rect.fromLTRB(
        size.width * .1,
        size.height * .1,
        size.width * .9,
        size.height * .9,
      ),
      secondAngle,
      2,
      false,
      myArc,
    );
    canvas.drawArc(
      Rect.fromLTRB(
        size.width * .2,
        size.height * .2,
        size.width * .8,
        size.height * .8,
      ),
      thirdAngle,
      2,
      false,
      myArc,
    );
    canvas.drawArc(
      Rect.fromLTRB(
        size.width * .3,
        size.height * .3,
        size.width * .7,
        size.height * .7,
      ),
      fourthAngle,
      2,
      false,
      myArc,
    );
    canvas.drawArc(
      Rect.fromLTRB(
        size.width * .4,
        size.height * .4,
        size.width * .6,
        size.height * .6,
      ),
      fifthAngle,
      2,
      false,
      myArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}