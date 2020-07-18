import 'package:anton_sih_app/core/api/endpoints.dart';
import 'package:anton_sih_app/models/bse_ca.dart';
import 'package:anton_sih_app/models/mc_ca.dart';
import 'package:anton_sih_app/models/nse_ca.dart';
import 'package:dio/dio.dart';

class BseLatestCa {
  String url = Endpoints.baseUrl + Endpoints.latestBseCa;
  Future<List<BseCa>> getLatestCa() async {
    List<BseCa> bseList = [];
    try {
      print('------BSE LATEST CA------');
      Response response = await Dio().get(url);
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
      print('------ERROR BSE LATEST CA------');
      print(e);
      return bseList;
    }
  }
}

class NseLatestCa {
  String url = Endpoints.baseUrl + Endpoints.latestNseCa;
  Future<List<NseCa>> getLatestCa() async {
    List<NseCa> nseList = [];
    try {
      print('------NSE LATEST CA------');
      Response response = await Dio().get(url);

      for (var ca in response.data['latest_ca']) {
        NseCa newCorporateAction = NseCa(
            purpose: ca['purpose'],
            recordDate: ca['record_date'],
            symbol: ca['symbol'],
            companyName: ca['company_name'],
            bcEndDate: ca['bc_end_date'],
            faceValue: ca['face_value'],
            exDate: ca['ex_date'],
            bcStartDate: ca['bc_start_date'],
            series: ca['series']);
        nseList.add(newCorporateAction);
      }
      return nseList;
    } catch (e) {
      print('------ERROR NSE LATEST CA------');
      print(e);
      return nseList;
    }
  }
}

class McLatestCa {
  String url = Endpoints.baseUrl + Endpoints.latestMcCa;
  Future<List<McCa>> getLatestCa() async {
    List<McCa> mcList = [];
    try {
      print('------MC LATEST CA------');
      Response response = await Dio().get(url);

      for (var ca in response.data['latest_ca']) {
        McCa newCorporateAction = McCa(
            exDate: ca['ex-date'],
            purpose: ca['purpose'],
            actualPaymentDate: ca['actual_payment_date'],
            recordDate: ca['record_date'],
            bcEndDate: ca['bc_end_date'],
            companyName: ca['company_name'],
            ndStartDate: ca['nd_start_date'],
            anouncment: ca['anouncement'],
            bcStartDate: ca['bs_start_date'],
            ndEndDate: ca['bc_end_date']);
        mcList.add(newCorporateAction);
      }
      return mcList;
    } catch (e) {
      print('------ERROR MC LATEST CA------');
      print(e);
      return mcList;
    }
  }
}
