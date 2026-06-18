import 'package:go_router/go_router.dart';
import 'package:pulse_monitor/presentation/pages/landing_page.dart';
import 'package:pulse_monitor/presentation/pages/sensor_details_page.dart';

final  goRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final location = state.uri.toString();
    if (location.startsWith('myapp://')) {
      return location.replaceFirst('myapp://', '/');
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: '/sensor/:zoneId',
      builder: (context, state) {
        final zoneId = state.pathParameters['zoneId']!;
        return SensorDetailsPage(zoneId: zoneId);
      },
    ),
  ],
);