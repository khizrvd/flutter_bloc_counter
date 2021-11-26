import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_counter/presentation/screens/second_screen.dart';
import 'business_logic/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => BlocProvider.value(
                value: CounterCubit(),
                child: const MyHomePage(
                    title: 'Home Screen', color: Colors.blueAccent),
              ),
          '/second-screen': (context) => BlocProvider.value(
                value: CounterCubit(),
                child: const SecondScreen(
                    title: 'Second Screen', color: Colors.blueAccent),
              ),
          '/third-screen': (context) => BlocProvider.value(
                value: CounterCubit(),
                child: const SecondScreen(
                    title: 'Third Screen', color: Colors.greenAccent),
              ),
        },
        // home: BlocProvider<CounterCubit>(
        //   create: (context) => CounterCubit(),
        //   child: const MyHomePage(
        //     title: 'Flutter Demo Home Page',
        //     color: Colors.blueAccent,
        //   ),
        // ),
      ),
    );
  }
}
