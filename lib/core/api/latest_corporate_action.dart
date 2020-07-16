import 'package:anton_sih_app/core/api/endpoints.dart';
import 'package:anton_sih_app/models/bse_ca.dart';
import 'package:dio/dio.dart';

class BseLatestCa {
  String url = Endpoints.baseUrl + Endpoints.latestBseCa;
  Future<List<BseCa>> getLatestCa() async {
    try {
      Response response = await Dio().get(url);
      List<BseCa> bseList = [];
      for (var ca in response.data['latest_ca']) {
        BseCa newCorporateAction = BseCa(
            securityName: ca['security_name'],
            ndEndDate: ca['nd_end_date'],
            securityCode: ca['security_code'],
            ndStartDate: ca['ns_start_date'],
            bcStartDate: ca['bc_start_date'],
            actualPaymentDate: ca['actual_payment_date'],
            recordDate: ca['record_date'],
            purpose: ca['purpose'],
            exDate: ca['ex_date'],
            bcEndDate: ca['bc_end_date']);
        bseList.add(newCorporateAction);
      }
      return bseList;
    } catch (e) {
      print(e);
    }
  }
}
