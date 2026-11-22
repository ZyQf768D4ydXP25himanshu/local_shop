import 'package:flutter/material.dart';
import '../../../../core/widgets/role_switch_button.dart';

class MerchantDashboardScreen extends StatefulWidget {
  const MerchantDashboardScreen({super.key});

  @override
  State<MerchantDashboardScreen> createState() => _MerchantDashboardScreenState();
}

class _MerchantDashboardScreenState extends State<MerchantDashboardScreen> {
  final List<Map<String, dynamic>> _inventory = [
    {"title": "Aashirvaad Atta 5kg", "price": "₹230", "inStock": true, "stockCount": 18},
    {"title": "Amul Butter 500g", "price": "₹275", "inStock": true, "stockCount": 6},
    {"title": "Fortune Oil 1L", "price": "₹140", "inStock": false, "stockCount": 0},
    {"title": "Tata Salt 1kg", "price": "₹28", "inStock": true, "stockCount": 42},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        title: const Text(
          "Merchant Console",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: RoleSwitchButton(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrange.shade500, Colors.orange.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.storefront, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gupta Kirana Store",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Hex Spatial ID: 8928308280fffff",
                          style: TextStyle(color: Colors.white70, fontSize: 11, fontFamily: 'monospace'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "ONLINE",
                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildStatCard("Today's Orders", "14", Icons.shopping_bag_outlined, Colors.blue),
                const SizedBox(width: 10),
                _buildStatCard("Active Items", "32", Icons.inventory_2_outlined, Colors.orange),
                const SizedBox(width: 10),
                _buildStatCard("Revenue", "₹4,250", Icons.payments_outlined, Colors.green),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Inventory Management",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 16, color: Colors.deepOrange),
                  label: const Text("Add Product", style: TextStyle(color: Colors.deepOrange, fontSize: 12)),
                )
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _inventory.length,
                itemBuilder: (context, index) {
                  final item = _inventory[index];
                  return Card(
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                      title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      subtitle: Text("Price: ${item['price']} • Stock: ${item['stockCount']} units", style: const TextStyle(fontSize: 12)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item['inStock'] ? "In Stock" : "Out of Stock",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: item['inStock'] ? Colors.green : Colors.red,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Switch(
                            value: item['inStock'],
                            activeThumbColor: Colors.deepOrange,
                            onChanged: (val) {
                              setState(() {
                                _inventory[index]['inStock'] = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepOrange,
        icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
        label: const Text("Scan Pickup QR", style: TextStyle(color: Colors.white)),
        onPressed: () {},
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 2),
            Text(title, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
