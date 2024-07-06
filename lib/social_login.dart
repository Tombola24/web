import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: const Text(
            '',
            style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: [
              /// Google
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.black87 : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    'lib/assets/images/google.svg',
                    height: 30,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Twitter
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.black87 : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    'lib/assets/images/twitter.svg',
                    height: 30,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // LinkedIn
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.black87 : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    'lib/assets/images/linkedin.svg',
                    height: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}