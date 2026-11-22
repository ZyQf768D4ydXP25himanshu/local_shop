import 'package:flutter/material.dart';
import '../theme/colors.dart';

/// Floating "View Cart" bar shown above the bottom navigation.
class StickyCartBar extends StatelessWidget {
  final int itemCount;
  final int total;
  final VoidCallback onViewCart;

  const StickyCartBar({
    super.key,
    this.itemCount = 1,
    this.total = 68,
    required this.onViewCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Material(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(14),
        elevation: 6,
        shadowColor: Colors.black45,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onViewCart,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text('$itemCount item · \u20b9$total',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                const Spacer(),
                const Text('View Cart',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
