import 'package:api_repository/api_repository.dart';
import 'package:bloc_app/features/api/bloc/api_bloc.dart';
import 'package:bloc_app/navigation/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/infinite_scroll_pagination.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class ApiPage extends StatelessWidget {
  const ApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ApiBloc(
        apiRepository: context.read(),
      )..add(PlantsFetched()),
      child: const ApiView(),
    );
  }
}

class ApiView extends StatefulWidget {
  const ApiView({super.key});

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  final PagingController<int, Plant> _pagingController = PagingController(
    firstPageKey: 1,
  );

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((_) {
      context.read<ApiBloc>().add(PlantsFetched());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Plants'), scrolledUnderElevation: 0),
        body: BlocBuilder<ApiBloc, ApiState>(
          builder: (_, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.size08,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppSearchField(
                          hintText: 'Search plants',
                          onChanged: (value) {
                            context.read<ApiBloc>().add(PlantsSearched(value));
                          },
                        ),
                      ),
                      AppSpaces.gap08,
                      FilterButton(
                        sunFilter: state.sunlightFilter,
                        waterFilter: state.wateringFilter,
                        onPressed: () => _openFilterSheet(state),
                      ),
                    ],
                  ),
                ),
                Expanded(child: _buildBody(state)),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _openFilterSheet(ApiState state) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (_) => BlocProvider.value(
        value: context.read<ApiBloc>(),
        child: FilterBottomSheet(
          sunFilter: state.sunlightFilter,
          waterFilter: state.wateringFilter,
          onFiltersApplied: (sun, water) => context.read<ApiBloc>().add(
                PlantsFiltered(sunFilter: sun, waterFilter: water),
              ),
        ),
      ),
    );
  }

  Widget _buildBody(ApiState state) {
    switch (state.status) {
      case ApiStatus.initial:
        return const Center(child: AppSpinner());
      case ApiStatus.failure:
        return const Center(child: Text('Something went wrong!'));
      case ApiStatus.success:
        if (state.plants.isEmpty) {
          return const Center(child: Text('No plants found!'));
        }
        _pagingController.value = PagingState(
          nextPageKey: state.page,
          itemList: state.plants,
          error: state.nextPageError,
        );
        return PagedListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.size16,
            vertical: Dimens.size20,
          ),
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, __) => AppSpaces.gap20,
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Plant>(
            itemBuilder: (_, plant, index) => PlantTile(
              image: plant.defaultImage?.regularUrl,
              commonName: plant.commonName ?? 'Unknown',
              scientificName: plant.scientificName?.single ?? 'Unknown',
              watering: plant.watering?.icon,
              sunlightList: plant.sunlight,
              onTap: () => context.vRouter.to(
                Paths.apiDetails.replaceFirst(':id', plant.id.toString()),
              ),
            ),
          ),
        );
    }
  }
}
