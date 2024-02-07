import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/presentation/screens/user_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/bloc/user_bloc.dart';
import 'src/service_locator.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => di.sl<UserBloc>(),
        child: const UserScreen(),
      ),
    );
  }
}
