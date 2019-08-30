import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_sample/src/checkedListview/check_model.dart';

//================ Input ======================
abstract class CheckListEvent {}

class FetchListEvent extends CheckListEvent {}

class CheckedEvent extends CheckListEvent {
  int index;
  CheckedEvent({@required this.index});
}

class UnCheckedEvent extends CheckListEvent {
  int index;
  UnCheckedEvent({@required this.index});
}

class TotalCheckedItemEvent extends CheckListEvent {}

//================ Output ======================
abstract class CheckListState {}

class InitCheckListState extends CheckListState {}

class ListStateLoaded extends CheckListState {
  List<CheckModel> items;
  int checkedItem;
  ListStateLoaded(this.items,this.checkedItem);
}

class TotalCheckedItem extends CheckListState {
  int total;
  TotalCheckedItem(this.total);
}

//================ Bloc ======================
class CheckListBloc extends Bloc<CheckListEvent, CheckListState> {
  @override
  CheckListState get initialState => InitCheckListState();

  @override
  Stream<CheckListState> mapEventToState(CheckListEvent event) async* {
    if (event is FetchListEvent) {
      final datas = await _getData();
      yield ListStateLoaded(datas, 0);
    } else if (event is CheckedEvent) {
      yield* _mapCheckedEventToState(event);
    } else if (event is UnCheckedEvent) {
      yield* _mapUnCheckedEventToState(event);
    }
  }

  Future<List<CheckModel>> _getData() async {
    List<CheckModel> datas = List();
    for (int i = 0; i < 20; i++) {
      datas.add(CheckModel('Title $i', false));
    }
    return datas;
  }

  Stream<CheckListState> _mapCheckedEventToState(CheckedEvent event) async* {
    if (currentState is ListStateLoaded) {
      final _items = (currentState as ListStateLoaded).items;
      for (int i = 0; i < _items.length; i++) {
        if (i == event.index) {
          _items[i].checked = true;
        }
      }
      yield ListStateLoaded(_items, _totalCheckedItem());
    }
  }

  Stream<CheckListState> _mapUnCheckedEventToState(
      UnCheckedEvent event) async* {
    if (currentState is ListStateLoaded) {
      final _items = (currentState as ListStateLoaded).items;
      for (int i = 0; i < _items.length; i++) {
        if (i == event.index) {
          _items[i].checked = false;
        }
      }
      yield ListStateLoaded(_items, _totalCheckedItem());
    }
  }

  int _totalCheckedItem() {
    var total = 0;
    if (currentState is ListStateLoaded) {
      final _items = (currentState as ListStateLoaded).items;
      _items.forEach((x) {
        if (x.checked) {
          total++;
        }
      });
      return total;
    }
  }
}
