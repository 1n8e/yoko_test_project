import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:yoko_test_project/data/active/datasource.dart';
import 'package:yoko_test_project/models/acitve_model.dart';

part 'active_event.dart';

part 'active_state.dart';

class ActiveBloc extends Bloc<ActiveEvent, ActiveState> {
  final Box tokens;
  final ActiveDataSource dataSource;

  ActiveBloc(this.dataSource, this.tokens) : super(ActiveInitial()) {
    on<GetActiveEvent>((event, emit) async {
      emit(LoadingActiveState());
      try {
        await tokens.get('access');
        final List<Active> actives = await dataSource.fetchActive();
        emit(SuccessLoadedState(actives));
      } catch (e) {
        emit(FailureLoadedState(e.toString()));
        rethrow;
      }
    });
  }
}
