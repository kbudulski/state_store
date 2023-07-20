import 'package:api_repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/api/provider/api_provider.dart';
import 'package:shared_dependencies/infinite_scroll_pagination.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';
import 'package:utils/utils.dart';

class ApiPage extends ConsumerStatefulWidget {
  const ApiPage({super.key});

  @override
  ApiPageState createState() => ApiPageState();
}

class ApiPageState extends ConsumerState<ApiPage> {
  final debouncer = Debouncer(duration: AppTimes.millis600);
  final PagingController<int, Plant> _pagingController = PagingController(
    firstPageKey: 0,
  );

  @override
  void initState() {
    super.initState();
    Future(() => ref.read(apiProvider.notifier).getPlants());
    _pagingController.addPageRequestListener((_) {
      ref.read(apiProvider.notifier).getPlants();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(apiProvider);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Plants'), scrolledUnderElevation: 0),
        body: Column(
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
                        debouncer.run(() {
                          ref.read(apiProvider.notifier).searchPlants(value);
                        });
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
        ),
      ),
    );
  }

  Future<void> _openFilterSheet(ApiState state) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (_) => FilterBottomSheet(
        sunFilter: state.sunlightFilter,
        waterFilter: state.wateringFilter,
        onFiltersApplied: (sun, water) => ref
            .read(apiProvider.notifier)
            .filterPlants(sunlightFilter: sun, wateringFilter: water),
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
