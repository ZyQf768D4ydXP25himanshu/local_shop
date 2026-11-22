import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/app_top_bar.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  const PlaceholderScreen({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(subtitle: title),
      backgroundColor: AppColors.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: AppColors.outline),
            const SizedBox(height: 12),
            Text('$title coming soon',
                style: const TextStyle(
                    color: AppColors.onSurfaceVariant, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
