import 'dart:math';

import 'package:flutter/widgets.dart';

class AppColors {
  static const Color rosa = Color.fromRGBO(245, 72, 127, 1);
  static const Color verde = Color.fromRGBO(88, 179, 104, 1);
  static const Color roxo = Color.fromRGBO(52, 48, 144, 1);
  static const Color ciano = Color.fromRGBO(68, 194, 253, 1);
  static const Color amarelo = Color.fromRGBO(250, 199, 54, 1);
  static const Color cinza = Color.fromRGBO(241, 240, 253, 1);
  static const Color roxo2 = Color.fromRGBO(175, 172, 243, 1);
  static const Color roxo3 = Color.fromRGBO(132, 129, 252, 1);

  static const blueGradient = LinearGradient(
    colors: <Color>[
      ciano,
      roxo,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.1,
      0.7,
    ],
    transform: GradientRotation((-34 * pi) / 180),
  );
//background: linear-gradient(117.91deg, #F1F0FD 0.89%, #AFACF3 144%);

  static const grayGradient = LinearGradient(
    colors: <Color>[
      cinza,
      roxo2,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.1,
      0.7,
    ],
    transform: GradientRotation((-34 * pi) / 180),
  );

  static const blueGradient2 = LinearGradient(
    colors: <Color>[
      ciano,
      roxo,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.1,
      0.60,
    ],
    transform: GradientRotation((55 * pi) / 180),
  );

}
