import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AppRole { customer, merchant }

class RoleState {
  final AppRole role;
  bool get isMerchant => role == AppRole.merchant;
  const RoleState({required this.role});
}

class RoleSwitchCubit extends Cubit<RoleState> with ChangeNotifier {
  RoleSwitchCubit() : super(const RoleState(role: AppRole.customer));

  void toggleRole() {
    if (state.role == AppRole.customer) {
      emit(const RoleState(role: AppRole.merchant));
    } else {
      emit(const RoleState(role: AppRole.customer));
    }
    notifyListeners();
  }
}
