import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'primary_scaffold.dart';

class ShellPage extends StatelessWidget {
  final Widget child;

  const ShellPage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final String currentLocation = GoRouterState.of(context).uri.path;

    return PrimaryScaffold(
      body: child,
      currentLocation: currentLocation,
    );
  }
}