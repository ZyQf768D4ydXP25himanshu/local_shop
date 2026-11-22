import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth_and_role_management/presentation/controllers/role_switch_cubit.dart';

class RoleSwitchButton extends StatelessWidget {
  const RoleSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoleSwitchCubit, RoleState>(
      builder: (context, state) {
        final isMerchant = state.isMerchant;
        return Container(
          decoration: BoxDecoration(
            color: isMerchant ? Colors.orange.shade50 : Colors.blue.shade50,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isMerchant ? Colors.deepOrange.shade200 : Colors.blue.shade200,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isMerchant ? Icons.storefront : Icons.shopping_bag_outlined,
                size: 16,
                color: isMerchant ? Colors.deepOrange : Colors.blue.shade800,
              ),
              const SizedBox(width: 6),
              Text(
                isMerchant ? "Merchant" : "Customer",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isMerchant ? Colors.deepOrange : Colors.blue.shade900,
                ),
              ),
              const SizedBox(width: 4),
              Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: isMerchant,
                  activeThumbColor: Colors.deepOrange,
                  onChanged: (_) {
                    context.read<RoleSwitchCubit>().toggleRole();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
