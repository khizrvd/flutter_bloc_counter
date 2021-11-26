import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/business_logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_counter/presentation/screens/second_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                Scaffold.of(context).showSnackBar(
                  state.wasIncremented
                      ? const SnackBar(
                          content: Text('Incremented'),
                          duration: Duration(milliseconds: 300),
                        )
                      : const SnackBar(
                          content: Text('Decremented'),
                          duration: Duration(milliseconds: 300),
                        ),
                );
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  //  BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 25),
            MaterialButton(
              color: Colors.blueAccent,
              child: const Text('Go To Second Screen'),
              onPressed: () {
                Navigator.of(context).pushNamed('/second-screen');
              },
            ),
            const SizedBox(height: 25),
            MaterialButton(
              color: Colors.greenAccent,
              child: const Text('Go To Third Screen'),
              onPressed: () {
                Navigator.of(context).pushNamed('/third-screen');
              },
            ),
          ],
        ),
      ),
);
  }
}
