import 'package:DemoFlutter/domain/usescase/PostUseCase.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/feed/bloc/FeedEvent.dart';
import 'package:DemoFlutter/presentation/views/feed/bloc/FeedState.dart';
import 'package:bloc/bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {

  PostUseCase postUseCase;
  FeedBloc(){
    this.postUseCase = Injector.inject().resolve<PostUseCase>();
  }

  @override
  FeedState get initialState => InitialState();

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async *{
    if(event is GetData) {
      yield LoadingState();

      try{
        yield FeedListReadyState(feedList: await postUseCase.getPosts());
      }catch(e){
        yield ErrorState(error: "Error al obtener Publicaciones");
      }
    }
  }

}