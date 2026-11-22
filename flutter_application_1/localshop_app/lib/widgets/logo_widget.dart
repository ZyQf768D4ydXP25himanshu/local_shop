import 'package:flutter/material.dart';
import 'net_image.dart';

/// LocalShop logo (storefront + geo-pin mark), same asset used across
/// the reference designs.
class LocalShopLogo extends StatelessWidget {
  final double size;
  const LocalShopLogo({super.key, this.size = 32});

  static const _logoUrl =
      'https://lh3.googleusercontent.com/aida/AEtjO1UUw3sMTVDGW99RQDo2Jvz-S1Zp0JmcTUxCWoLN5ND5N9ppozmo_OHb_zRl1abNpP4_M4Xc9blrppAumEhFH8u0-CryJ0BgIb9RarKFKqEqfdlS7iDHrdYAeUBLiXNFlzcQqRaTuXukehSuLGQtMa-zqVWCUiHReZYIIKsSBDql9NokoMrGJHsz1FV6o7SbtJ-JSj7Xbq6knnndOk3PkR7ccPap5uUYxqOUHECBdk5a';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size * 0.25),
      child: NetImage(url: _logoUrl, width: size, height: size),
    );
  }
}
