import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/app_top_bar.dart';

class CompareShopsScreen extends StatefulWidget {
  const CompareShopsScreen({super.key});
  @override
  State<CompareShopsScreen> createState() => _CompareShopsScreenState();
}

class _CompareShopsScreenState extends State<CompareShopsScreen> {
  int _sortIndex = 0;
  final _sorts = const ['Nearest (350m)', 'Lowest Price (\u20b925)', 'Fastest (12m)', 'Best Rated (4.8)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(subtitle: 'Compare'),
      backgroundColor: AppColors.surface,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(14)),
            child: const Row(children: [
              Icon(Icons.search, color: AppColors.primary),
              SizedBox(width: 8),
              Expanded(child: Text('Tata Salt Vacuum Evaporated 1kg', style: TextStyle(fontWeight: FontWeight.w700))),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(color: AppColors.secondaryContainer.withValues(alpha: 0.4), borderRadius: BorderRadius.circular(10)),
            child: const Row(children: [
              Icon(Icons.circle, size: 8, color: AppColors.primary),
              SizedBox(width: 6),
              Expanded(
                  child: Text('Available at 8 verified local shops nearby',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.onSecondaryContainer))),
              Text('SECTOR 62', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.secondary)),
            ]),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _sorts.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) => ChoiceChip(
                label: Text(_sorts[i]),
                selected: _sortIndex == i,
                selectedColor: AppColors.primary,
                labelStyle: TextStyle(color: _sortIndex == i ? Colors.white : AppColors.onSurfaceVariant, fontSize: 12),
                onSelected: (_) => setState(() => _sortIndex = i),
              ),
            ),
          ),
          const SizedBox(height: 14),
          _storeCard('Sharma General Store', 4.7, '1,240+ reviews', '350 m', '15\u201320 min', '24 left', 27, 28,
              feeLine: 'Fee: \u20b915 (Free above \u20b9199)', recommended: true, inCartQty: 1),
          const SizedBox(height: 12),
          _storeCard('City Grocery Store', 4.4, '410 reviews', '1.1 km', '25\u201330 min', 'Only 2 left!', 25, 28,
              feeLine: 'Delivery fee: \u20b925', tag: 'Cheapest'),
          const SizedBox(height: 12),
          _storeCard('Gupta Supermart', 4.8, '890 reviews', '550 m', '12\u201315 min', '18 units', 26, 28,
              feeLine: 'Delivery fee: \u20b920', tag: 'Fastest'),
          const SizedBox(height: 12),
          _storeCard('Modern Daily Mart', 4.6, '560 reviews', '850 m', '20 min', 'In Stock', 28, 28,
              feeLine: 'Delivery fee: \u20b915'),
          const SizedBox(height: 12),
          _outOfStockCard(),
          const SizedBox(height: 16),
          _tipCard(),
        ],
      ),
    );
  }

  Widget _storeCard(String name, double rating, String reviews, String distance, String eta, String stock, int price, int mrp,
      {String? feeLine, bool recommended = false, String? tag, int inCartQty = 0}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)],
          border: recommended ? Border.all(color: AppColors.primary.withValues(alpha: 0.3)) : null),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (recommended)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
            child: const Text('RECOMMENDED \u00b7 BEST BALANCE', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: AppColors.primary)),
          ),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Flexible(child: Text(name, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15))),
                if (tag != null)
                  Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: AppColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(6)),
                          child: Text(tag, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w700)))),
              ]),
              Row(children: [
                const Icon(Icons.star, size: 13, color: AppColors.tertiary),
                Text(' $rating \u00b7 $reviews', style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
              ])
            ]),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('\u20b9$price', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
            Text('\u20b9$mrp', style: const TextStyle(fontSize: 11, color: AppColors.outline, decoration: TextDecoration.lineThrough)),
          ])
        ]),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            _metric('DISTANCE', distance),
            _metric('DELIVERY', eta),
            _metric('STOCK', stock),
          ]),
        ),
        const SizedBox(height: 10),
        Row(children: [
          if (feeLine != null) Expanded(child: Text(feeLine, style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant))),
          if (inCartQty > 0)
            Container(
              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(10)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.remove, color: Colors.white, size: 16)),
                Text('$inCartQty', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add, color: Colors.white, size: 16)),
              ]),
            )
          else
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Add'),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.surfaceContainerLow, foregroundColor: AppColors.primary)),
        ])
      ]),
    );
  }

  Widget _metric(String label, String value) => Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: const TextStyle(fontSize: 9, color: AppColors.outline, fontWeight: FontWeight.w700)),
          Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
        ]),
      );

  Widget _outOfStockCard() => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: AppColors.surfaceContainerLowest.withValues(alpha: 0.7), borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(children: [
            Expanded(child: Text('Aggarwal Provisions', style: TextStyle(fontWeight: FontWeight.w600))),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('\u20b926', style: TextStyle(color: AppColors.outline, fontWeight: FontWeight.w700)),
              Text('Out of Stock', style: TextStyle(color: AppColors.error, fontSize: 11, fontWeight: FontWeight.w700)),
            ])
          ]),
          const Text('1.8 km away \u00b7 ETA ~35 min', style: TextStyle(fontSize: 11, color: AppColors.outline)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.errorContainer.withValues(alpha: 0.4), borderRadius: BorderRadius.circular(8)),
            child: const Text('Next stock batch arriving today at 4:00 PM', style: TextStyle(fontSize: 11, color: AppColors.onErrorContainer)),
          ),
          const SizedBox(height: 8),
          SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.notifications_active_outlined, size: 16), label: const Text('Notify When In Stock'))),
        ]),
      );

  Widget _tipCard() => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(16)),
        child: const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.lightbulb_outline, color: AppColors.tertiary),
          SizedBox(width: 8),
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('LocalShop Decision Helper', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
            Text('Sharma General Store is 750m closer and only \u20b92 more than City Grocery. Fastest delivery saves 15 mins!',
                style: TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant)),
          ]))
        ]),
      );
}
