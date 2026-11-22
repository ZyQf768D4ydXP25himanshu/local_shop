import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/features/auth_and_role_management/presentation/controllers/role_switch_cubit.dart';
import 'package:flutter_application_1/features/ai_search_and_discovery/presentation/screens/ai_search_screen.dart';
import 'package:flutter_application_1/features/merchant_inventory_and_store/presentation/screens/merchant_dashboard_screen.dart';

class AppRouter {
  static GoRouter router(RoleSwitchCubit roleCubit) {
    return GoRouter(
      initialLocation: '/',
      refreshListenable: roleCubit,
      redirect: (context, state) {
        final isMerchant = roleCubit.state.isMerchant;
        final goingToMerchant = state.matchedLocation.startsWith('/merchant');

        if (isMerchant && !goingToMerchant) {
          return '/merchant/dashboard';
        } else if (!isMerchant && goingToMerchant) {
          return '/';
        }
        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const AISearchScreen(),
        ),
        GoRoute(
          path: '/merchant/dashboard',
          builder: (context, state) => const MerchantDashboardScreen(),
        ),
      ],
    );
  }
}
