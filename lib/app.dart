import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shartflix/core/theme/app_theme.dart';
import 'package:shartflix/di.dart'; // Import di for sl
import 'package:shartflix/core/services/locale_provider.dart';
import 'package:shartflix/l10n/app_localizations.dart';
import 'package:shartflix/presentation/cubits/auth/auth_bloc.dart'; // Import AuthBloc
import 'package:shartflix/presentation/cubits/movie/movie_cubit.dart'; // Import MovieCubit
import 'package:shartflix/presentation/cubits/favorite_movie/favorite_movie_cubit.dart'; // Import FavoriteMovieCubit
import 'package:shartflix/presentation/navigation/app_router.dart';
import 'package:shartflix/presentation/pages/home/home_page.dart'; // Import the example home page

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final localeProvider = Provider.of<LocaleProvider>(context);
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(create: (_) => sl<AuthBloc>()),
            BlocProvider<MovieCubit>(create: (_) => sl<MovieCubit>()),
            BlocProvider<FavoriteMovieCubit>(
              create: (_) => sl<FavoriteMovieCubit>(),
            ),
          ],
          child: ScreenUtilInit(
            designSize: const Size(402, 874),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Shartflix',
                theme: AppTheme.lightTheme,
                routerConfig: AppRouter.router,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: L10n.all,
                locale: localeProvider.locale,
              );
            },
          ),
        );
      },
    );
  }
}
