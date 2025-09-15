import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/profile/token_package_badge.dart';
import 'package:shartflix/presentation/widgets/profile/token_package_content.dart';

class TokenPackageCard extends StatelessWidget {
  final String oldPrice;
  final String newPrice;
  final String tokenText;
  final String price;
  final String frequencyText;
  final Color gradientColor1;
  final Color gradientColor2;
  final String badgeText;
  final Color badgeColor;

  const TokenPackageCard({
    super.key,
    required this.oldPrice,
    required this.newPrice,
    required this.tokenText,
    required this.price,
    required this.frequencyText,
    required this.gradientColor1,
    required this.gradientColor2,
    required this.badgeText,
    required this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TokenPackageContent(
          oldPrice: oldPrice,
          newPrice: newPrice,
          tokenText: tokenText,
          price: price,
          frequencyText: frequencyText,
          gradientColor1: gradientColor1,
          gradientColor2: gradientColor2,
        ),
        TokenPackageBadge(
          badgeText: badgeText,
          badgeColor: badgeColor,
        ),
      ],
    );
  }
}
