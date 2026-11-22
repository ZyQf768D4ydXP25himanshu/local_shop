import 'package:flutter/material.dart';
import '../../../../core/widgets/role_switch_button.dart';

class AISearchScreen extends StatefulWidget {
  const AISearchScreen({super.key});

  @override
  State<AISearchScreen> createState() => _AISearchScreenState();
}

class _AISearchScreenState extends State<AISearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  String _selectedDistance = "500m";

  final List<Map<String, dynamic>> _searchResults = [
    {
      "store_name": "Gupta Kirana Store",
      "distance": "180m away",
      "h3_index": "8928308280fffff",
      "product": "Aashirvaad Atta 5kg",
      "price": "₹230",
      "mrp": "₹250",
      "inStock": true,
      "rating": "4.8"
    },
    {
      "store_name": "SuperMart Express",
      "distance": "450m away",
      "h3_index": "8928308283fffff",
      "product": "Aashirvaad Atta 5kg",
      "price": "₹225",
      "mrp": "₹250",
      "inStock": true,
      "rating": "4.6"
    },
    {
      "store_name": "Sharma General Store",
      "distance": "820m away",
      "h3_index": "8928308285fffff",
      "product": "Aashirvaad Atta 5kg",
      "price": "₹235",
      "mrp": "₹250",
      "inStock": false,
      "rating": "4.2"
    }
  ];

  void _executeAISearch() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hyperlocal AI Discovery",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              children: [
                Icon(Icons.location_on, size: 12, color: Colors.blue),
                SizedBox(width: 4),
                Text("H3 Cell: 8928308280fffff (Sector 62)", style: TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            )
          ],
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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Try: 'Aashirvaad Atta 5kg sabse sasta kahan milega?'",
                  hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                  prefixIcon: const Icon(Icons.psychology_outlined, color: Colors.blue),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.arrow_forward_rounded, color: Colors.blue),
                    onPressed: _executeAISearch,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                const Text("Range: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 6),
                ...["200m", "500m", "1km", "2km"].map((dist) {
                  final isSelected = _selectedDistance == dist;
                  return Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: ChoiceChip(
                      label: Text(dist, style: TextStyle(fontSize: 11, color: isSelected ? Colors.white : Colors.black87)),
                      selected: isSelected,
                      selectedColor: Colors.blue,
                      onSelected: (val) {
                        if (val) setState(() => _selectedDistance = dist);
                      },
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 16),
            if (_isLoading) ...[
              const LinearProgressIndicator(),
              const SizedBox(height: 16),
            ],
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final item = _searchResults[index];
                  final bool inStock = item['inStock'];
                  return Card(
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.shopping_bag, color: Colors.blue, size: 30),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['product'],
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Text(item['store_name'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                    const SizedBox(width: 6),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        "H3: ${item['h3_index'].toString().substring(0, 7)}...",
                                        style: const TextStyle(fontSize: 9, fontFamily: 'monospace'),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text(
                                      item['price'],
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      item['mrp'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(Icons.directions_walk, size: 14, color: Colors.grey.shade600),
                                    Text(" ${item['distance']}", style: const TextStyle(fontSize: 11, color: Colors.grey)),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: inStock ? Colors.blue : Colors.grey.shade300,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            ),
                            onPressed: inStock ? () {} : null,
                            child: Text(
                              inStock ? "Pickup" : "Out of Stock",
                              style: const TextStyle(fontSize: 11),
                            ),
                          )
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
    );
  }
}
