import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/business_logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_counter/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_counter/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_counter/presentation/screens/third_screen.dart';

class AppRouter {
  final _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const MyHomePage(
                title: 'Home Screen', color: Colors.indigo),
          ),
        );
        break;
      case '/second-screen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const SecondScreen(
                title: 'Second Screen', color: Colors.amber),
          ),
        );
        break;
      case '/third-screen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const ThirdScreen(
                title: 'Third Screen', color: Colors.pink),
          ),
        );
        break;
        default:
          return null;
    }
  }
  void dispose() {
    _counterCubit.close();
  }
}
