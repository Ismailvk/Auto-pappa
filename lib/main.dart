import 'package:auto_pappa/controller/login/login_bloc.dart';
import 'package:auto_pappa/controller/signup/signup_bloc.dart';
import 'package:auto_pappa/data/shared_preference/shared_preference.dart';
import 'package:auto_pappa/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.instance.initStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => SignupBloc())
      ],
      child: MaterialApp(
        title: 'Auto Pappa',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.yellow),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
            useMaterial3: true),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
