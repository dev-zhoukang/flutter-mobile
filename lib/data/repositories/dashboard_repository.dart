import 'dart:async';
import 'dart:core';
import 'package:meta/meta.dart';
import 'package:invoiceninja/data/models/serializers.dart';
import 'package:invoiceninja/redux/auth/auth_state.dart';
import 'package:invoiceninja/data/models/entities.dart';
import 'package:invoiceninja/data/file_storage.dart';
import 'package:invoiceninja/data/web_client.dart';

class DashboardRepository {
  final WebClient webClient;

  const DashboardRepository({
    this.webClient = const WebClient(),
  });

  Future<DashboardEntity> loadItem(CompanyEntity company, AuthState auth) async {

    final response = await webClient.get(
        auth.url + '/dashboard', company.token);

    DashboardResponse dashboardResponse = serializers.deserializeWith(
        DashboardResponse.serializer, response);

    return dashboardResponse.data;
  }
}