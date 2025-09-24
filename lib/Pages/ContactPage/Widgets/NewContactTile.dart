import 'package:flutter/material.dart';

class NewContactTile extends StatelessWidget {
  final String btnName;
  final IconData icon;
  final VoidCallback onTap;

  const NewContactTile({
    super.key,
    required this.btnName,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                icon,
                size: 25,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            SizedBox(width: 20),
            Text(btnName),
          ],
        ),
      ),
    );
  }
}
