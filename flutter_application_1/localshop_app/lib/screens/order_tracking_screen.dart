import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/app_top_bar.dart';
import '../widgets/net_image.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(subtitle: 'Orders'),
      backgroundColor: AppColors.surface,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          _etaBanner(),
          const SizedBox(height: 14),
          _storeStrip(),
          const SizedBox(height: 14),
          _mapAndRider(),
          const SizedBox(height: 14),
          _timelineCard(),
          const SizedBox(height: 14),
          _itemsCard(),
          const SizedBox(height: 14),
          _supportCard(),
        ],
      ),
    );
  }

  Widget _etaBanner() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(18)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(
                width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.secondaryContainer, shape: BoxShape.circle)),
            const SizedBox(width: 6),
            const Text('LIVE FULFILLMENT',
                style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.6)),
            const Spacer(),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(20)),
                child: const Text('#LS1028', style: TextStyle(color: Colors.white, fontSize: 11))),
          ]),
          const SizedBox(height: 10),
          const Row(children: [
            Text('Arriving in 14 Mins', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
            SizedBox(width: 6),
            Icon(Icons.bolt, color: AppColors.secondaryContainer, size: 20),
          ]),
          const SizedBox(height: 4),
          const Text('Est. Arrival at 10:56 AM · Placed at 10:42 AM',
              style: TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const LinearProgressIndicator(
                value: 0.7,
                minHeight: 8,
                backgroundColor: Colors.white24,
                valueColor: AlwaysStoppedAnimation(AppColors.secondaryContainer)),
          ),
          const SizedBox(height: 6),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Order Verified', style: TextStyle(color: Colors.white70, fontSize: 10)),
            Text('Packing at Store (70%)',
                style: TextStyle(color: AppColors.secondaryContainer, fontSize: 10, fontWeight: FontWeight.w700)),
            Text('Delivery', style: TextStyle(color: Colors.white70, fontSize: 10)),
          ])
        ]),
      );

  Widget _storeStrip() => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),
        child: Row(children: [
          Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(color: AppColors.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.storefront, color: AppColors.primary)),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text('Sharma General Store', style: TextStyle(fontWeight: FontWeight.w700)),
                SizedBox(width: 4),
                Icon(Icons.verified, size: 14, color: AppColors.primary)
              ]),
              Text('350m away · Sector 62 Market', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
            ]),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call, color: AppColors.primary),
              style: IconButton.styleFrom(backgroundColor: AppColors.surfaceContainer)),
          const SizedBox(width: 4),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble_outline, color: AppColors.primary),
              style: IconButton.styleFrom(backgroundColor: AppColors.surfaceContainer)),
        ]),
      );

  Widget _mapAndRider() => Container(
        decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)]),
        clipBehavior: Clip.antiAlias,
        child: Column(children: [
          Container(
            height: 140,
            width: double.infinity,
            color: AppColors.surfaceContainer,
            child: Stack(children: [
              const Center(child: Icon(Icons.map_outlined, size: 48, color: AppColors.outline)),
              Positioned(top: 8, left: 8, child: _chip('Live Partner Tracking', dot: true)),
              Positioned(top: 8, right: 8, child: _chip('350m away')),
              const Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Row(children: [
                      Icon(Icons.store, size: 16, color: Colors.white),
                      SizedBox(width: 4),
                      Text('Sharma Store', style: TextStyle(color: Colors.white, fontSize: 11))
                    ]),
                    Icon(Icons.trending_flat, color: Colors.white70, size: 16),
                    Row(children: [
                      Icon(Icons.home, size: 16, color: Colors.white),
                      SizedBox(width: 4),
                      Text('Flat 402', style: TextStyle(color: Colors.white, fontSize: 11))
                    ]),
                  ])),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(children: [
              Stack(children: [
                const CircleAvatar(
                    radius: 24, backgroundColor: AppColors.surfaceContainer, child: Icon(Icons.person, color: AppColors.onSurfaceVariant)),
                Positioned(
                    bottom: -2,
                    right: -2,
                    child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                        child: const Icon(Icons.electric_moped, size: 12, color: Colors.white))),
              ]),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Text('Sonu Kumar', style: TextStyle(fontWeight: FontWeight.w700)),
                    SizedBox(width: 6),
                    Icon(Icons.star, size: 12, color: AppColors.tertiary),
                    Text(' 4.9', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700))
                  ]),
                  Text('Hero Electric Bike · Verified Partner',
                      style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
                ]),
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.call, size: 16),
                  label: const Text('Call'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryContainer, foregroundColor: AppColors.onSecondaryContainer)),
            ]),
          )
        ]),
      );

  Widget _chip(String text, {bool dot = false}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.95), borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (dot)
            Container(
                width: 6, height: 6, margin: const EdgeInsets.only(right: 4), decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
          Text(text, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.onSurface)),
        ]),
      );

  Widget _timelineCard() {
    final steps = <(String, String, String, bool, bool)>[
      ('Order Placed & Paid', '10:42 AM', '\u20b9180 paid via Google Pay UPI.', true, false),
      ('Shop Accepted', '10:43 AM', 'Mr. Ramesh Sharma confirmed availability.', true, false),
      ('Packing Order at Store', '10:45 AM', 'Merchant is packaging 3 items.', false, true),
      ('Out for Delivery', 'Est. 10:50 AM', 'Sonu Kumar will pick up parcel.', false, false),
      ('Delivered to Doorstep', 'Est. 10:56 AM', 'Flat 402, Green Valley Apartments.', false, false),
    ];
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(children: [
          Expanded(child: Text('Order Progress', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15))),
          Text('5 STAGES', style: TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.w800)),
        ]),
        const SizedBox(height: 12),
        for (int i = 0; i < steps.length; i++)
          _timelineStep(steps[i].$1, steps[i].$2, steps[i].$3, steps[i].$4, steps[i].$5, isLast: i == steps.length - 1),
      ]),
    );
  }

  Widget _timelineStep(String title, String time, String desc, bool done, bool active, {bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
                color: done ? AppColors.primary : (active ? AppColors.secondaryContainer : AppColors.surfaceContainerHighest),
                shape: BoxShape.circle),
            child: Icon(done ? Icons.check : (active ? Icons.circle : Icons.circle_outlined),
                size: done ? 14 : 10, color: done ? Colors.white : (active ? AppColors.primary : AppColors.onSurfaceVariant)),
          ),
          if (!isLast) Expanded(child: Container(width: 2, color: done ? AppColors.primary : AppColors.surfaceContainerHighest)),
        ]),
        const SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Expanded(
                    child: Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 13, color: active ? AppColors.primary : AppColors.onSurface))),
                Text(time, style: const TextStyle(fontSize: 10, color: AppColors.onSurfaceVariant)),
              ]),
              Text(desc, style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
            ]),
          ),
        )
      ]),
    );
  }

  Widget _itemsCard() => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(children: [
            Icon(Icons.shopping_basket_outlined, color: AppColors.primary, size: 18),
            SizedBox(width: 6),
            Expanded(child: Text('Items in Package', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)))
          ]),
          const SizedBox(height: 10),
          _itemRow('Amul Taaza Milk', '1 Litre · Qty: 1', 68,
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDrSiGC-YUpwuejeQnhhhMdavY4N4HGJ9QLBpY4Deiibn8Hsp7mEvWYvRIcArfu6VHZl-Bm4HW8UUdMdg-9WIjibd4lKJGHFfpaPwTkl8rnY3i15B6aNSQ-ygNHesQ1azaNrTfWeqBvifSLhlRg9qazqMqGoWj_Qrpws-sD4m9M3G2fajJRwkKTcZpVK8Lv1sGGITCFUi7RHW4oUZ95sqWFhTxzwhblAlTuCprbGBI'),
          const Divider(),
          _itemRow('Tata Salt', '1 kg · Qty: 2', 54,
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAdkmdUxqBlDcTIU6YxbHojFu8D4UK7Ru0EBeyQVZQWntFAyQ3LC5WTS0ZdFSp7yoDRiTMchv25dtKnFTJ5Y8RGUxtkO1eRs0lMDOwb0k9nz4pEDLkd8HAQkcqd-HE02cmnEQBdeaYSaNidttvn7_UHndAnaZm3hP5YLw8XSY3sFebvHHx5TSyrBrke_pwS5Ii16xxrYwzydRvsTZYTETEub7dGmIJkoO4O4fzTCWQ'),
          const Divider(),
          _itemRow('Britannia 100% Wheat Bread', '400g · Qty: 1', 45,
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDILqBFqQCyr9AsmOGfOUzgOldgXYGM8d5VEDZ75-nIGowFwq_FFjuEj9Tz2bATKN0kx4oVhYP2goDlyEjDUgxoKyc_mr1j52CGQLO-5xmeiSa6DG4mlc35lUhcYy5Arc8uRFovU7GSA31G_qcGW86hQ2KlnIXF-IWs55ysZEzQnWuXmKcCA77ocoU9yxw6iwDKVvMaALYNNKqAZTnfgRnSjExqrrBXY72cusqn0NE'),
          const SizedBox(height: 10),
          _billLine('Item Subtotal', '\u20b9167'),
          _billLine('Handling & Packaging Fee', '\u20b913'),
          _billLine('Neighborhood Delivery', 'FREE', valueColor: AppColors.primary),
          const Divider(),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Total Paid', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
            Text('\u20b9180', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: AppColors.primary)),
          ])
        ]),
      );

  Widget _itemRow(String name, String meta, int price, String image) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(children: [
          ClipRRect(borderRadius: BorderRadius.circular(10), child: NetImage(url: image, width: 48, height: 48)),
          const SizedBox(width: 10),
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
            Text(meta, style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
          ])),
          Text('\u20b9$price', style: const TextStyle(fontWeight: FontWeight.w700)),
        ]),
      );

  Widget _billLine(String label, String value, {Color? valueColor}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant)),
          Text(value, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: valueColor ?? AppColors.onSurface)),
        ]),
      );

  Widget _supportCard() => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(children: [
            Icon(Icons.support_agent, color: AppColors.primary),
            SizedBox(width: 8),
            Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Local Support Desk', style: TextStyle(fontWeight: FontWeight.w700)),
              Text('Direct line to Sector 62 Hub', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
            ]))
          ]),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.phone_in_talk, size: 16), label: const Text('Call Support'))),
            const SizedBox(width: 8),
            Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline, size: 16), label: const Text('Order Help'))),
          ])
        ]),
      );
}
