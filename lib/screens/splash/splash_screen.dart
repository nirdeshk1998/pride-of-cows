import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/providers/splash_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    ref.read(splashProvider).splashTimer(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Assets.assetsImagesSplashBg,
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: double.maxFinite,
          ),
          Align(
            alignment: const Alignment(0, -0.2),
            child: Image.asset(
              Assets.assetsLogoPocLogo,
              height: 192,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
