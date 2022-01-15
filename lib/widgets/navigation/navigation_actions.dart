import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import '../../locator.dart';

List<TextButton> navigationActions = [
// home
  TextButton.icon(
    onPressed: () {
      locator<NavigationService>().navigateTo(HomeViewRoute);
    },
    icon: const Icon(Icons.home_rounded),
    label: const Text('Home'),
  ),
  // register
  TextButton.icon(
    onPressed: () {
      locator<NavigationService>().navigateTo(RegisterViewRoute);
    },
    icon: const Icon(Icons.person_add_rounded),
    label: const Text('Register'),
  ),
  // login
  TextButton.icon(
    onPressed: () {
      locator<NavigationService>().navigateTo(LoginViewRoute);
    },
    icon: const Icon(Icons.login_rounded),
    label: const Text('Login'),
  ),
  // // cart
  // TextButton.icon(
  //   onPressed: () {},
  //   icon: const Icon(Icons.shopping_cart_rounded),
  //   label: const Text('Cart'),
  // ),
  // // contact
  // TextButton.icon(
  //   onPressed: () {},
  //   icon: const Icon(Icons.contact_page_rounded),
  //   label: const Text('Contact'),
  // ),
  // // logout
  // TextButton.icon(
  //   onPressed: () {},
  //   icon: const Icon(Icons.logout_rounded),
  //   label: const Text('Logout'),
  // ),
];
