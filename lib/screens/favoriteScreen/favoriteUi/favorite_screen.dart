import 'package:club/screens/favoriteScreen/favoriteCubit/favorite_cubit.dart';
import 'package:club/screens/favoriteScreen/favoriteUi/favorite_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<FavoriteCubit>(
      create: (BuildContext context) => FavoriteCubit(),
      child: const FavoriteForm(),
    );
  }
}