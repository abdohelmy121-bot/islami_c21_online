import 'package:flutter/material.dart';
import 'package:islamic_c21_online/core/theme/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double angle = 0;
  int num_of_tsbeh = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sebha_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.black.withValues(alpha: 0.8), AppColors.black],
            end: AlignmentGeometry.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Image.asset("assets/logo/logo_header.png", width: 300),
              ),
              Padding(
                padding: const EdgeInsets.all(35),
                child: Text(
                  "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Image.asset("assets/images/Group 37.png", width: 145, height: 86),
              Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        angle += 2;
                        num_of_tsbeh++;
                      });
                    },
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        "assets/images/SebhaBody 1.png",
                        width: 380,
                        height: 380,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "سبحان الله",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "$num_of_tsbeh",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
