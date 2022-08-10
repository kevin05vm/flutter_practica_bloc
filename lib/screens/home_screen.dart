import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_practica_bloc/bloc/home/home_bloc.dart';
import 'package:flutter_practica_bloc/utils/colors_app.dart';
import 'package:flutter_practica_bloc/widgets/card_meme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: colorAppBar,
        title: const Text('Meme App')
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (_, homeState) {
          if(homeState is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if(homeState is HomeMemesState) {
            return ListView.builder(
              itemCount: homeState.memes.length,
              itemBuilder: (context, index) {
                return CardMeme(meme: homeState.memes[index]);
              }
            );
          }
          return const Center(child: Text('Error Api....'));
        }
      )
    );
  }
}