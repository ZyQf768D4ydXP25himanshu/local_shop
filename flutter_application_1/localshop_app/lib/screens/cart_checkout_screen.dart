// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/app_top_bar.dart';
import '../widgets/net_image.dart';

class CartCheckoutScreen extends StatefulWidget {
  const CartCheckoutScreen({super.key});
  @override
  State<CartCheckoutScreen> createState() => _CartCheckoutScreenState();
}

class _CartCheckoutScreenState extends State<CartCheckoutScreen> {
  bool _isDelivery = true;
  String _payment = 'upi';
  int _qtyMilk = 1;
  int _qtySalt = 2;
  int _qtyBread = 1;

  int get _subtotal => 68 * _qtyMilk + 27 * _qtySalt + 45 * _qtyBread;
  int get _deliveryFee => _isDelivery ? 15 : 0;
  int get _total => _subtotal + 5 + _deliveryFee - 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(subtitle: 'Checkout'),
      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              children: [
                _shopHeader(),
                const SizedBox(height: 12),
                _fulfillmentToggle(),
                const SizedBox(height: 12),
                if (_isDelivery) _addressCard(),
                if (_isDelivery) const SizedBox(height: 12),
                _cartItemsCard(),
                const SizedBox(height: 12),
                _paymentCard(),
                const SizedBox(height: 12),
                _billCard(),
                const SizedBox(height: 12),
                _trustCard(),
              ],
            ),
          ),
          _checkoutBar(),
        ],
      ),
    );
  }

  Widget _shopHeader() => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('ORDERING FROM', style: TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.w700)),
              Text('Sharma General Store', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            ])),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(20)),
                child: const Text('Verified Merchant', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700))),
          ]),
          const SizedBox(height: 8),
          const Row(children: [
            Icon(Icons.location_on, size: 14, color: AppColors.primary),
            SizedBox(width: 4),
            Text('350m away \u00b7 Sector 62, Greater Noida', style: TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant))
          ]),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(10)),
            child: const Text(
                'Packed fresh & fulfilled by Sharma General Store. Single-store checkout guarantees 15\u201320 min doorstep delivery.',
                style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
          )
        ]),
      );

  Widget _fulfillmentToggle() => Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(14)),
        child: Row(children: [
          Expanded(child: _toggleBtn('Local Delivery', '15\u201320 min \u00b7 \u20b915', Icons.two_wheeler, _isDelivery, () => setState(() => _isDelivery = true))),
          Expanded(child: _toggleBtn('Free Shop Pickup', 'Ready in 10 min \u00b7 \u20b90', Icons.directions_walk, !_isDelivery, () => setState(() => _isDelivery = false))),
        ]),
      );

  Widget _toggleBtn(String title, String sub, IconData icon, bool active, VoidCallback onTap) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: active ? AppColors.surfaceContainerLowest : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              boxShadow: active ? [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 4)] : null),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(icon, size: 16, color: AppColors.primary),
              const SizedBox(width: 4),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12))
            ]),
            Text(sub, style: const TextStyle(fontSize: 10, color: AppColors.onSurfaceVariant)),
          ]),
        ),
      );

  Widget _addressCard() => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(children: [
            Icon(Icons.home_outlined, color: AppColors.primary, size: 18),
            SizedBox(width: 6),
            Expanded(child: Text('Deliver To Home', style: TextStyle(fontWeight: FontWeight.w700))),
            Text('CHANGE', style: TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.w800)),
          ]),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(10)),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Flat 402, Tower B, Green Valley Apts', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
              Text('Sector 62, Greater Noida \u00b7 Near City Park Gate 2', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
            ]),
          ),
          const SizedBox(height: 8),
          Wrap(spacing: 8, children: [
            FilterChip(label: const Text('Ring doorbell'), selected: true, onSelected: (_) {}),
            FilterChip(label: const Text('Leave at door'), selected: false, onSelected: (_) {}),
            FilterChip(label: const Text('Do not call'), selected: false, onSelected: (_) {}),
          ])
        ]),
      );

  Widget _cartItemsCard() => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(children: [
            Icon(Icons.shopping_basket_outlined, color: AppColors.primary),
            SizedBox(width: 6),
            Expanded(child: Text('Items in Cart', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15))),
            Text('3 items', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant))
          ]),
          const SizedBox(height: 10),
          _cartItem('Amul Taaza Fresh Toned Milk', '1 Litre', 68,
              'https://lh3.googleusercontent.com/aida-public/AB6AXuCrU3kH64icfvVij8o0Jk9c6NqKJOp44WwUXD66qu-Rf0GZix0r_wPNa34zl6yGb9BcGsUyjYOztNesoppnpIUwDMEFEkc9Bv1QCjtuiWuOJv6VDsTkoB6rEQWu3UR6xSGPv4XxBaeLu5uTz42Kfs3u04p5gDnhB72iv97I0Y3TbjYxPsE-YuHT7T5zeEx6ueMFAItViPckW96vRYlS3sMvoHL_xMErM0-ONehdvEc',
              _qtyMilk, (v) => setState(() => _qtyMilk = v)),
          const Divider(),
          _cartItem('Tata Salt Vacuum Evaporated', '1 kg', 27,
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBtHuDm5GPsmgZBRnLnOK-d1XoIqR7VNUIoqQIb4kuOIka9vh-hcRsra1dpWeHMnU5a54jTdA4gFWXg0zKTAzsQqRGR47qWNM5ysoc1dgbyLXUHlHDrw1CiWqQUW0RODbqi1RJmH9H3EB8vxXXsktJaGHViEcbCzpHG6HY5njFrq2lEtIDdVS9VE--KwKaITou5ZAnh1Ij32FHONhfV5DDi2Yl69TdYOtM6QmwgK8k',
              _qtySalt, (v) => setState(() => _qtySalt = v)),
          const Divider(),
          _cartItem('Britannia 100% Whole Wheat Bread', '400 g', 45,
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBYgHdNDdWtgGocYVszZ8Igtr_gHKc-aFJ0-bxSfUxl5uY09uCMKjZBfSnFVjqVB7VNodO7Lbjjse73RrbNAxLfntoUk6EkukFu2ZVe5UQWeyMnbjENOpInhKX0rJvyRbfnwmUSo4dwY2feJ8jz6O2Hb0VMhTO6SU0oxMTRJELXQnXdhEpyN_8cyPN5EMnn6T1PRaVepJO3PgnDq3zSLz6LfZa0nPDdAKf48ACn1no',
              _qtyBread, (v) => setState(() => _qtyBread = v)),
        ]),
      );

  Widget _cartItem(String name, String weight, int price, String image, int qty, ValueChanged<int> onQty) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(children: [
          ClipRRect(borderRadius: BorderRadius.circular(10), child: NetImage(url: image, width: 52, height: 52)),
          const SizedBox(width: 10),
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
            Text(weight, style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
            Text('\u20b9$price', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
          ])),
          Container(
            decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(8)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(
                  onPressed: () {
                    if (qty > 1) onQty(qty - 1);
                  },
                  icon: const Icon(Icons.remove, size: 16),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 30, minHeight: 30)),
              Text('$qty', style: const TextStyle(fontWeight: FontWeight.w700)),
              IconButton(
                  onPressed: () => onQty(qty + 1),
                  icon: const Icon(Icons.add, size: 16, color: AppColors.primary),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 30, minHeight: 30)),
            ]),
          )
        ]),
      );

  Widget _paymentCard() => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(children: [
            Icon(Icons.payments_outlined, color: AppColors.primary),
            SizedBox(width: 6),
            Expanded(child: Text('Payment Options', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)))
          ]),
          const SizedBox(height: 8),
          _paymentTile('upi', 'UPI Instant', 'Google Pay, PhonePe, Paytm, BHIM', Icons.account_balance_wallet_outlined, tag: 'FASTEST'),
          _paymentTile('cod', 'Cash on Delivery', 'Pay in cash or QR code on delivery', Icons.payments_outlined),
          _paymentTile('card', 'Debit / Credit Card', 'Visa, Mastercard, RuPay & more', Icons.credit_card),
        ]),
      );

  Widget _paymentTile(String value, String title, String sub, IconData icon, {String? tag}) => RadioListTile<String>(
        value: value,
        groupValue: _payment,
        onChanged: (v) => setState(() => _payment = v!),
        contentPadding: EdgeInsets.zero,
        tileColor: _payment == value ? AppColors.surfaceContainerLow : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        activeColor: AppColors.primary,
        title: Row(children: [
          Icon(icon, size: 18, color: AppColors.onSurfaceVariant),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
          if (tag != null)
            Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(color: AppColors.secondaryContainer, borderRadius: BorderRadius.circular(6)),
                    child: Text(tag, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w800)))),
        ]),
        subtitle: Padding(
            padding: const EdgeInsets.only(left: 26), child: Text(sub, style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant))),
      );

  Widget _billCard() => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Bill Summary', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
          const SizedBox(height: 8),
          _billRow('Item Total', '\u20b9$_subtotal'),
          _billRow('Shop Handling & Packaging', '\u20b95'),
          _billRow('Local Delivery Partner Fee', '\u20b9$_deliveryFee'),
          _billRow('LocalShop Community Savings', '-\u20b97', color: AppColors.primary),
          const Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('To Pay', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            Text('\u20b9$_total', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: AppColors.primary)),
          ])
        ]),
      );

  Widget _billRow(String label, String value, {Color? color}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant)),
          Text(value, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: color ?? AppColors.onSurface)),
        ]),
      );

  Widget _trustCard() => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(14)),
        child: const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.verified_outlined, color: AppColors.primary),
          SizedBox(width: 8),
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Neighborhood Merchant Trust', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
            Text('100% Genuine products packed directly by Mr. Sharma. Instant doorstep replacement or refund.',
                style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
          ]))
        ]),
      );

  Widget _checkoutBar() => Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 10, offset: const Offset(0, -2))]),
        child: SafeArea(
          top: false,
          child: Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('\u20b9$_total', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
              Text(_payment == 'upi' ? 'UPI Instant Pay' : (_payment == 'cod' ? 'Cash on Delivery' : 'Card Payment'),
                  style: const TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.w700)),
            ]),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order placed successfully!')));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(180, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                Text('Place Order', style: TextStyle(fontWeight: FontWeight.w700)),
                SizedBox(width: 6),
                Icon(Icons.arrow_forward, size: 18)
              ]),
            )
          ]),
        ),
      );
}



