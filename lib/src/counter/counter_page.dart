import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/src/counter/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: BlocBuilder(
        bloc: _counterBloc,
        builder: (context, state) {
          return Center(
            child: Text('$state', style: TextStyle(fontSize: 28),),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'increment',
              child: Icon(Icons.add),
              onPressed: () {
                _counterBloc.increment();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'decrement',
              child: Icon(Icons.remove),
              onPressed: () {
                _counterBloc.decrement();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatActionButton() {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ],
    );
  }
}
