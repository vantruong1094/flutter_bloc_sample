
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/src/timer/ticker.dart';
import 'package:flutter_bloc_sample/src/timer/timer_bloc.dart';
import 'package:flutter_bloc_sample/src/timer/timer_event.dart';
import 'package:flutter_bloc_sample/src/timer/timer_state.dart';

class TickerMyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => TimerBloc(ticker: Ticker()),
      child: MyTickerWidget(),
    );
  }
}

class MyTickerWidget extends StatefulWidget {
  @override
  _MyTickerWidgetState createState() => _MyTickerWidgetState();
}

class _MyTickerWidgetState extends State<MyTickerWidget> {

  static const TextStyle timerTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
  ); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Timer')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: Center(
              child: BlocBuilder<TimerBloc, TimerState>(
                builder: (context, state) {
                  final String minutesStr = ((state.duration / 60) % 60)
                      .floor()
                      .toString()
                      .padLeft(2, '0');
                  final String secondsStr =
                      (state.duration % 60).floor().toString().padLeft(2, '0');
                  return Text(
                    '$minutesStr:$secondsStr',
                    style: _MyTickerWidgetState.timerTextStyle,
                  );
                },
              ),
            ),
          ),
          BlocBuilder<TimerBloc, TimerState>(
            condition: (previousState, currentState) =>
                currentState.runtimeType != previousState.runtimeType,            
            builder: (context, state) => Actions(),
          ),
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _mapStateToActionButtons(
        timerBloc: BlocProvider.of<TimerBloc>(context),
      ),
    );
  }

  List<Widget> _mapStateToActionButtons({
    TimerBloc timerBloc,
  }) {
    final TimerState state = timerBloc.currentState;
    if (state is Ready) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () => timerBloc.dispatch(Start(duration: state.duration)),
        ),
      ];
    }
    if (state is Running) {
      return [
        FloatingActionButton(
          child: Icon(Icons.pause),
          onPressed: () => timerBloc.dispatch(Pause()),
        ),
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.dispatch(Reset()),
        ),
      ];
    }
    if (state is Paused) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () => timerBloc.dispatch(Resume()),
        ),
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.dispatch(Reset()),
        ),
      ];
    }
    if (state is Finished) {
      return [
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.dispatch(Reset()),
        ),
      ];
    }
    return [];
  }
}
