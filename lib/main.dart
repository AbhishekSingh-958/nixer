import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nixler_demo/constants/app_global_constant.dart';
import 'package:nixler_demo/src/features/dashboard/provider/dashboard_provider.dart';
import 'package:nixler_demo/src/features/events/provider/event_provider.dart';
import 'package:nixler_demo/src/features/events/repository/event_repository.dart';
import 'package:provider/provider.dart';

import 'core/api_client/dio_utils_service.dart';
import 'core/config/size_config.dart';
import 'core/route/app_route.dart';
import 'core/localDb/sharedPrefs/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferencesManager().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 800),
      builder: (context, child) =>
          LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          final _dio = DioUtil().getInstance();
          return MultiProvider(
            providers: [
              Provider(create: (context) => EventRepository(dio: _dio)),
              ChangeNotifierProvider(
                create: (context) => DashBoardProvider(),
              ),
              ChangeNotifierProvider(
                create: (context) =>
                    EventProvider(context.read<EventRepository>()),
              ),
            ],
            child: MaterialApp(
              title: "Nixler",
              debugShowCheckedModeBanner: false,
              scaffoldMessengerKey: AppGlobalConstants.scaffoldKey,
              onGenerateRoute: GenerateRoute.generateRoute,
              theme: ThemeData(fontFamily: 'Poppins'),
            ),
          );
        });
      }),
    );
  }
}
