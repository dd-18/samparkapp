import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String btnName;
  final IconData? icon;
  final VoidCallback? onTap;

  const PrimaryButton({super.key, required this.btnName, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(width: 10),
            Text(btnName, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
