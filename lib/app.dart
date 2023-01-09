import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/locale/app_localizations_setup.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'features/splash/presentation/cubit/locale_cubit.dart';
import 'injection_container.dart' as di;

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.sl<LocaleCubit>()..getSavedLang(),
          ),
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          buildWhen: (previous, current) {
           return previous != current;
          },
          builder: (context, state) {
            return MaterialApp(
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              theme: appTheme(),
              onGenerateRoute: AppRoutes.onGenerateRoute,
            );
          },
        ));
  }
}
