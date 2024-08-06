import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/checkpoint_model.dart';

part 'checkpoints_repository.g.dart';

@riverpod
Future<List<CheckpointModel>> checkpointsRepository(CheckpointsRepositoryRef ref) async {
  return [
    CheckpointModel(name: "Punkt 1", isVisited: true),
    CheckpointModel(name: "Punkt 2", isVisited: true),
    CheckpointModel(name: "Punkt 3", isVisited: true),
    CheckpointModel(name: "Punkt 4", isVisited: true),
    CheckpointModel(name: "Punkt 5"),
    CheckpointModel(name: "Punkt 6"),
    CheckpointModel(name: "Punkt 7"),
    CheckpointModel(name: "Punkt 8"),
    CheckpointModel(name: "Punkt 9"),
  ];
}