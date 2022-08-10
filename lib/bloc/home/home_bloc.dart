import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_practica_bloc/models/meme.dart';
import 'package:flutter_practica_bloc/repository/memes_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  
  final _memesRepository = MemesRepository();

  HomeBloc() : super(const HomeLoadingState()) {
    
    on<LoadMemes>((event, emit) async {
      emit(const HomeLoadingState());
      await Future.delayed(const Duration(seconds: 2), (){});
      final memes = await _memesRepository.getMemes();
      if(memes.isNotEmpty) {
        emit(HomeMemesState(memes));
      }
      else {
        emit(const HomeErrorState());
      }
    });
  }

}