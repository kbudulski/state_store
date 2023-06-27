import 'package:bloc_app/features/api/bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class PlantSearchField extends StatelessWidget {
  const PlantSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search plants',
        isDense: true,
        filled: true,
        fillColor: context.color.inversePrimary,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: radius(Dimens.size16),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Dimens.size16,
          vertical: Dimens.size08,
        ),
      ),
      onChanged: (value) {
        context.read<ApiBloc>().add(PlantsSearched(value));
      },
    );
  }
}
