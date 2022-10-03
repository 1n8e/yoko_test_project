import 'package:flutter/material.dart';
import 'package:yoko_test_project/bloc/auth/auth_cubit.dart';
import 'package:yoko_test_project/core/injections.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoko_test_project/ui/auth/auth_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokens');
  setupInjections();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => getIt<AuthCubit>()),
      ],
      child: const MaterialApp(
        home: AuthScreen(),
      ),
    );
  }
}
