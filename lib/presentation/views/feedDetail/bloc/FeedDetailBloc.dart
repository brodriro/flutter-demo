import 'package:DemoFlutter/presentation/views/feedDetail/bloc/FeedDetailEvent.dart';
import 'package:DemoFlutter/presentation/views/feedDetail/bloc/FeedDetailState.dart';
import 'package:bloc/bloc.dart';

class FeedDetailbloc extends Bloc<FeedDetailEvent, FeedDetailState> {
  @override
  FeedDetailState get initialState => InitialState();

  @override
  Stream<FeedDetailState> mapEventToState(FeedDetailEvent event) async * {

  }

}