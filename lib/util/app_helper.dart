import 'package:flutter_auth_page/resources/app_resources.dart';
import 'package:flutter_auth_page/urls.dart';

enum ChartType { line, bar, pie, scatter, radar }

extension ChartTypeExtension on ChartType {
  String get displayName => '$simpleName Chart';

  String get simpleName {
    switch (this) {
      case ChartType.line:
        return 'Line';
      case ChartType.bar:
        return 'Bar';
      case ChartType.pie:
        return 'Pie';
      case ChartType.scatter:
        return 'Scatter';
      case ChartType.radar:
        return 'Radar';
      default:
        return 'Unknown';
    }
  }

  String get documentationUrl => Urls.getChartDocumentationUrl(this);

  String get assetIcon => AppAssets.getChartIcon(this);
}
