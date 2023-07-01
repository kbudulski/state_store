import 'package:bloc_app/features/api_details/cubit/api_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/cached_network_image.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class ApiDetailsPage extends StatelessWidget {
  const ApiDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = context.vRouter.pathParameters['id'] ?? '';

    return BlocProvider(
      create: (context) => ApiDetailsCubit(
        context.read(),
      )..fetchPlantDetails(id),
      child: const ApiDetailsView(),
    );
  }
}

class ApiDetailsView extends StatelessWidget {
  const ApiDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Details'),
        scrolledUnderElevation: 0,
      ),
      body: BlocBuilder<ApiDetailsCubit, ApiDetailsState>(
        builder: (_, state) {
          switch (state) {
            case ApiDetailsLoading():
              return const AppSpinner();
            case ApiDetailsError():
              return const ErrorMessage('Something went wrong!');
            case ApiDetailsLoaded():
              final details = state.plantDetails;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(Dimens.size16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(details.defaultImage?.regularUrl),
                    const SizedBox(height: Dimens.size16),
                    Text(
                      details.commonName ?? 'Unknown',
                      style: context.textTheme.displaySmall,
                    ),
                    const SizedBox(height: Dimens.size08),
                    Text(
                      details.scientificName?.first ?? 'Unknown',
                      style: context.textTheme.headlineLarge?.copyWith(
                        color: const Color.fromRGBO(156, 214, 125, 1),
                      ),
                    ),
                    const SizedBox(height: Dimens.size16),
                    Text(
                      details.description ?? '-',
                      textAlign: TextAlign.justify,
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }

  Widget _buildImage(String? image) {
    if (image == null) return const SizedBox.shrink();

    return CachedNetworkImage(
      imageUrl: image,
      width: double.maxFinite,
      height: 300,
      imageBuilder: (_, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: radius(Dimens.size16),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      errorWidget: (_, __, ___) => const Icon(Icons.error),
      placeholder: (_, __) => const AppSpinner(),
    );
  }
}
