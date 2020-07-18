import 'package:anton_sih_app/core/api/endpoints.dart';
import 'package:anton_sih_app/models/bse_ca.dart';
import 'package:anton_sih_app/models/mc_ca.dart';
import 'package:anton_sih_app/models/nse_ca.dart';
import 'package:dio/dio.dart';

class BseFavCa {
  Future<List<BseCa>> getFavCa(String secCode) async {
    List<BseCa> bseList = [];
    String url = Endpoints.baseUrl + "/api/bse_companyca/511333";
    try {
      print('------BSE FAV CA------');
      Response response = await Dio().get(url);
      for (var ca in response.data['ca']) {
        BseCa newCorporateAction = BseCa(
            securityName: ca['security_name'],
            ndEndDate: ca['nd_end_date'],
            securityCode: ca['security_code'],
            ndStartDate: ca['nd_start_date'],
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
      print('------ERROR BSE FAV CA------');
      print(e);
      return bseList;
    }
  }
}
