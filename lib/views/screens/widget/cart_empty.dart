import 'package:flutter/material.dart';

class CartEmpty extends StatefulWidget {
  @override
  State<CartEmpty> createState() => _CartEmptyState();
}

class _CartEmptyState extends State<CartEmpty>
    with SingleTickerProviderStateMixin {
  final Tween<double> dondurTween = Tween<double>(
    begin: 0,
    end: 5,
  );
  double _initialScale = 1.0;
  double _scaleFactor = 1.0;
  double _currentScale = 1.0;

  AnimationController? controller;
  bool first = true;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onScaleStart: (details) {
          _initialScale = _scaleFactor;
        },
        onScaleUpdate: (details) {
          setState(() {
            _scaleFactor = _initialScale * details.scale;
          });
        },
        child: Container(
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RotationTransition(
                turns: dondurTween.animate(controller!),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/images/kart.png',
                    fit: BoxFit.cover,
                    scale: _scaleFactor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                onPressed: () {
                  if (first) {
                    controller?.forward();
                  } else {
                    controller?.reverse();
                  }
                  first = !first;
                },
                child: Text(
                  'Alışveriş zamanı',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                  textScaleFactor: _scaleFactor,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
