import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/money/bloc/money_bloc.dart';
import 'features/money/models/money.dart';
import 'features/target/bloc/target_bloc.dart';
import 'features/target/models/target.dart';

void main() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('moneybox');
  Hive.registerAdapter(MoneyAdapter());
  Hive.registerAdapter(TargetAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => MoneyBloc()),
        BlocProvider(create: (context) => TargetBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
