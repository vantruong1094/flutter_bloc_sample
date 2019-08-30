import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/src/checkedListview/check_list_bloc.dart';
import 'package:flutter_bloc_sample/src/checkedListview/check_model.dart';

class CheckListPage extends StatefulWidget {
  @override
  _CheckListPageState createState() => _CheckListPageState();
}

class _CheckListPageState extends State<CheckListPage> {
  CheckListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CheckListBloc();
    _bloc.dispatch(FetchListEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Check list'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: BlocBuilder(
                  bloc: _bloc,
                  builder: (context, state) {
                    if (state is ListStateLoaded) {
                      return Container(
                        color: Colors.white,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 0.5,
                            );
                          },
                          shrinkWrap: true,
                          itemCount: state.items.length,
                          itemBuilder: (context, index) {
                            return _buildItemListView(
                                state.items[index], index);
                          },
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              BlocBuilder(
                bloc: _bloc,
                builder: (context, state) {
                  return _buildBottomView(state);
                },
              )
            ],
          ),
        ));
  }

  Widget _buildItemListView(CheckModel data, int index) {
    return Container(
      height: 45,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Text(data.content),
          ),
          Spacer(),
          IconButton(
            iconSize: 30,
            icon: data.checked
                ? Icon(
                    Icons.check_box,
                    color: Colors.pink,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.pink,
                  ),
            onPressed: () {
              if (data.checked) {
                _bloc.dispatch(UnCheckedEvent(index: index));
              } else {
                _bloc.dispatch(CheckedEvent(index: index));
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildBottomView(CheckListState state) {
    final _total = (state is ListStateLoaded) ? state.checkedItem : 0;
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: double.infinity,
      color: Colors.red,
      child: Text(
        'Total: ${_total.toString()}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
