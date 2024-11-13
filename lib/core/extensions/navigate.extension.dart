import 'package:flutter/material.dart';

extension NavigateEffectiveTo on Widget {
  Future navigateEffectiveTo({required BuildContext context}) async =>
      await Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => this,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(-1.0, 0.0);
              var end = Offset.zero;
              var curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ));
}

extension NavigateEffectiveToPushReplacement on Widget {
  Future navigateEffectiveToPushReplacement(
          {required BuildContext context}) async =>
      await Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => this,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(-1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
}

extension NavigateEffectiveToBack on Widget {
  Future navigateEffectiveToBack({required BuildContext context}) async =>
      await Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => this,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(-1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
}
