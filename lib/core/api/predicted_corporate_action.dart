import 'package:anton_sih_app/models/predicted_ca.dart';
import 'package:dio/dio.dart';

import 'endpoints.dart';

class PredictedCa {
  String url = Endpoints.baseUrl + Endpoints.predictedCa;
  Future<List<PredictedCaModel>> getPredictedCa() async {
    List<PredictedCaModel> predictedList = [];
    try {
      print('------PREDICTED CA------');
      Response response = await Dio().get(url);

      for (var ca in response.data['latest_ca']) {
        PredictedCaModel predictedCorporateAction = PredictedCaModel(
          securityName: ca['security_name'],
          purpose: ca['purpose'],
          date: ca['date'],
          content: ca['content'],
        );
        predictedList.add(predictedCorporateAction);
      }
      return predictedList;
    } catch (e) {
      print('------ERROR MC LATEST CA------');
      print(e);
      return predictedList;
    }
  }
}
