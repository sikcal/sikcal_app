import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/repo/user_repo.dart';
import 'package:sikcal/model/User.dart';

final userRepoProvider = Provider((ref) => UserRepo(ref));
final userBasicProvider = Provider((ref) => User()); // TODO from json
final loadingStateProvider = StateProvider((ref) => true);