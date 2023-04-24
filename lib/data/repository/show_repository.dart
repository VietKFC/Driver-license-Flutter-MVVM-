import 'package:driver_license_test/data/model/show.dart';
import 'package:injectable/injectable.dart';

import '../service/api_service.dart';

@lazySingleton
class ShowRepository {
  final ApiService _apiService;

  ShowRepository(this._apiService);

  Future<List<Show>> getRecentShows() => _apiService.getRecentShows();
}
