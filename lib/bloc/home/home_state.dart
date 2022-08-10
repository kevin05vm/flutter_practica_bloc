part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState() : super();
}

class HomeErrorState extends HomeState {
  const HomeErrorState() : super();
}

class HomeMemesState extends HomeState {
  final List<Meme> memes;
  const HomeMemesState(this.memes);
}
