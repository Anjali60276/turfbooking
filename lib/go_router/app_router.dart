import 'package:go_router/go_router.dart';

import '../pages/dashboard_pages.dart';
import '../pages/bookings_pages.dart';
import '../pages/customers_pages.dart';
import 'shell_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ShellPage(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const DashboardPages(),
        ),
        GoRoute(
          path: '/bookings',
          builder: (context, state) => const BookingsPages(),
        ),
        GoRoute(
          path: '/customers',
          builder: (context, state) => const CustomersPages(),
        ),
      ],
    ),
  ],
);