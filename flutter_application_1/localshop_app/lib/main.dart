import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/colors.dart';
import 'screens/home_screen.dart';
import 'screens/order_tracking_screen.dart';
import 'screens/placeholder_screen.dart';

void main() {
  runApp(const LocalShopApp());
}

class LocalShopApp extends StatelessWidget {
  const LocalShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LocalShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.surface,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          surface: AppColors.surface,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  final _screens = const [
    HomeScreen(),
    PlaceholderScreen(title: 'Categories', icon: Icons.grid_view_rounded),
    OrderTrackingScreen(),
    PlaceholderScreen(title: 'Wishlist', icon: Icons.favorite_border),
    PlaceholderScreen(title: 'Profile', icon: Icons.person_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.secondaryContainer.withValues(alpha: 0.35),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.storefront_outlined), selectedIcon: Icon(Icons.storefront), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view), label: 'Categories'),
          NavigationDestination(icon: Icon(Icons.local_mall_outlined), selectedIcon: Icon(Icons.local_mall), label: 'Orders'),
          NavigationDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
