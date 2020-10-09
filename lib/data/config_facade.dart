import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:ongraph_tech_r1_task/data/remote_data_source.dart';

abstract class IConfigFacade {
  Future<dynamic> getAllConfigurations();
}

@Singleton(as: IConfigFacade)
class ConfigStoreImpl implements IConfigFacade {
  @override
  Future getAllConfigurations() async {
    var res = await RemoteDataSource.fetchConfig();
    var goodJson = res.body.replaceAll('\n', ' ');
    return Future.value(jsonDecode(goodJson));
  }
}
