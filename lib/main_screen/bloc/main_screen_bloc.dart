import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ctf_ver_1/Models/twit_model.dart';
part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {

  AllPosts stateNow = AllPosts();
  MainScreenBloc() : super(MainScreenInitial()) {
    on<MainScreenEvent>((event, emit) {
      // TODO: implement event handler
    });


    on<GetAllTwits>((event, emit) {
      List<TwitModel> allData = [
        TwitModel(name: 
        "Марков Лаврентий",
        someText: "Добрый день всем. Я новый президент США. Моя новая цель: Победа России в СВО и остановка украинсокй власти"
        , image: "https://avatars.mds.yandex.net/get-entity_search/1554108/979273824/S600xU_2x"
        ),
        TwitModel(name: 
        "Мартынов Дмитрий",
        someText: "Добрый день всем. Я новый президент США. Моя новая цель: Победа России в СВО и остановка украинсокй власти. Я также поддерживаю Владимира Владимировича Путина"
        , image: "https://avatars.mds.yandex.net/get-entity_search/1554108/979273824/S600xU_2x"
        ),
        TwitModel(name: 
        "Малеков Дмитрий",
        someText: "Добрый день всем. Я новый президент США. Моя новая цель: Победа России в СВО и остановка украинсокй власти. Я также поддерживаю Маркова Лаврентия Сергеевича"
        , image: "https://avatars.mds.yandex.net/get-entity_search/1554108/979273824/S600xU_2x"
        )
      ];

      AllPosts newState = AllPosts();
      newState.allTwits = [...allData];
      emit(newState);
    },);
  }
}
