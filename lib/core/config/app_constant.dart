import 'package:flutter/material.dart';

class AppConstant {
  static const kMockupHeight = 812;
  static const kMockupWidth = 375;
  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
  );
  static const appName = 'EaseStudyante';

  static const clientId = 'za0JTqP0o9c6NExKIXDOYTEqvud3uwu35f3raHDV';
  static const clientSecret =
      'QuOKuhMhlqoyXkBL2TuhbKlwak2Ic6HpbQc4YqdbIIJIEokRNwcx9sgMa4sLKlf9kFUhpPMnQ8waLpEKNGf4hBVZ9BKTP7wxstef6JiPO1qX2GJjQHdifxEfD0s38UKJ';
  static const serverUrl = 'https://ease-studyante-core.onrender.com';
  //'http://192.168.68.100:8000';
  //za0JTqP0o9c6NExKIXDOYTEqvud3uwu35f3raHDV
  //QuOKuhMhlqoyXkBL2TuhbKlwak2Ic6HpbQc4YqdbIIJIEokRNwcx9sgMa4sLKlf9kFUhpPMnQ8waLpEKNGf4hBVZ9BKTP7wxstef6JiPO1qX2GJjQHdifxEfD0s38UKJ
  static const apiUrl = '$serverUrl/api';
  static const apiUser = '$serverUrl/user';
}
