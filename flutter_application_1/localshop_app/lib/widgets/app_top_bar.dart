import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'logo_widget.dart';

/// Shared header used on every screen: logo + title, notification bell,
/// profile avatar and the "Deliver to" location row.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String subtitle;
  final String locationText;

  const AppTopBar({
    super.key,
    required this.subtitle,
    this.locationText = 'Deliver to Home - Greater Noida, Sector 62',
  });

  @override
  Size get preferredSize => const Size.fromHeight(94);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          color: AppColors.surface,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const LocalShopLogo(size: 34),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LocalShop',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: AppColors.onSurface,
                        ),
                      ),
                      Text(
                        subtitle.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_outlined,
                            color: AppColors.onSurfaceVariant),
                      ),
                      Positioned(
                        right: 4,
                        top: 6,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                              color: AppColors.error, shape: BoxShape.circle),
                          child: const Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.surfaceContainer,
                    child: Icon(Icons.person,
                        color: AppColors.onSurfaceVariant, size: 18),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Icon(Icons.near_me, size: 15, color: AppColors.primary),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      locationText,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onSurface),
                    ),
                  ),
                  const Icon(Icons.expand_more, size: 16, color: AppColors.outline),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
