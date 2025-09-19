import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Config/Images.dart';
import '../../../Config/Strings.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsImage.boypic),
            SizedBox(width: 10),
            SvgPicture.asset(AssetsImage.connectIconSVG),
            SizedBox(width: 10),
            Image.asset(AssetsImage.girlpic),
          ],
        ),
        SizedBox(height: 30),
        Text(
          WelcomePageStrings.nowYouAre,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          WelcomePageStrings.connected,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: 40),
        Text(
          WelcomePageStrings.description,
          style: Theme.of(context).textTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
