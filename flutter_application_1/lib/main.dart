import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/config/routes/app_router.dart';
import 'features/auth_and_role_management/presentation/controllers/role_switch_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RoleSwitchCubit(),
      child: Builder(
        builder: (context) {
          final roleCubit = context.watch<RoleSwitchCubit>();
          final router = AppRouter.router(roleCubit);

          return MaterialApp.router(
            title: 'Hyperlocal Local Marketplace',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: roleCubit.state.isMerchant ? Colors.deepOrange : Colors.blue,
              useMaterial3: true,
            ),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
