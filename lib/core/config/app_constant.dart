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

  static const clientId = 'Y5N3M1dsDYlmqUKtiumR6aVMtB5GY596pLIEjkyq';
  static const clientSecret =
      'Jr1eFjDPoItmqgS4pWGbrTd8XNgKOQwEIetlY1VumSc1Ee7R0l3qJrjuioAbNzyULgQ0avshnkwOAcxLO3WWOYmc7kxH8pvVuIezasJGEMzJ55NcdUXdY5Q8R6Ts3sdJ';
  static const serverUrl = 'http://127.0.0.1:8000';

  static const apiUrl = '$serverUrl/api';
  static const apiUser = '$serverUrl/user';
}
