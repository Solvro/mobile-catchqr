import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/app_theme.dart';
import '../../theme/colors.dart';
import '../../utils/context_extensions.dart';
import 'models/filters_enum.dart';
import 'repository/checkpoints_repository.dart';
import 'widgets/custom_progress_bar.dart';
import 'widgets/filters_bar.dart';
import 'widgets/checkpoints_listview.dart';


class PointsListScreen extends ConsumerStatefulWidget {
  const PointsListScreen({super.key});

  @override
  ConsumerState<PointsListScreen> createState() => _PointsListScreenState();
}

class _PointsListScreenState extends ConsumerState<PointsListScreen> {

  Filters currentFilter = Filters.all;
  
  void onTap(int index){
    setState(() {
      currentFilter = Filters.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {

    final checkpoints = ref.watch(checkpointsRepositoryProvider);

    return switch (checkpoints){
      AsyncData(:final value) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: context.colorTheme.greyLight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.chevron_left,
                              color: ColorsConsts.orangePomegranate,
                            ),
                            Text(
                              context.localize.back ,
                              style: context.textTheme.smallPomegradeText,
                            ),
                          ],
                        ),
                      ),
                    ),
          
                    const SizedBox(height: 16,),
          
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Lista punktów",
                        style: context.textTheme.headline,
                        textAlign: TextAlign.start,
                      ),
                    ),
          
                    const SizedBox(height: 10,),
          
                    CustomProgressBar(
                      backgroundColor: Colors.green[200],
                      color: Colors.green,
                      height: 36,
                      value: value.where((value) => value.isVisited == true).length/value.length,
                      textStyle: context.textTheme.smallText,
                      text: "${context.localize.finished}: ${value.where((value) => value.isVisited == true).length}/${value.length}",
                    ),
          
                    const SizedBox(height: 16,),
          
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: FiltersBar(onTap: onTap, currentFilter: currentFilter,),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) {
                  final filteredCheckpoints = switch (currentFilter) {
                    Filters.all => value,
                    Filters.visited => value.where((value) => value.isVisited == true),
                    Filters.unvisited => value.where((value) => value.isVisited == false)
                  }.toList();
                  return CheckpointsListview(
                    points: filteredCheckpoints
                  );
                }
              )
            ],
          ),
        ),
      ),
      AsyncError() => const Scaffold(
        body: Center(
          child: Text('Oops, something unexpected happened')
        ),
      ),
      _ => const CircularProgressIndicator(),
    };
  }
}
