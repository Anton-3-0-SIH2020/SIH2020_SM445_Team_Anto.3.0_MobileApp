import 'package:anton_sih_app/core/api/endpoints.dart';
import 'package:anton_sih_app/models/bse_ca.dart';
import 'package:anton_sih_app/models/mc_ca.dart';
import 'package:anton_sih_app/models/nse_ca.dart';
import 'package:dio/dio.dart';

class BseCompanyCa {
  Future<List<BseCa>> getCompanyCa(String code) async {
    List<BseCa> bseList = [];
    String url = Endpoints.baseUrl + Endpoints.companyBseCa + code;
    try {
      print('------BSE COMPANY CA------');
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
      print('------ERROR BSE COMPANY CA------');
      print(e);
      return bseList;
    }
  }
}

class NseCompanyCa {
  Future<List<NseCa>> getCompanyCa(String code) async {
    String url = Endpoints.baseUrl + Endpoints.companyNseCa + code;
    List<NseCa> nseList = [];
    try {
      print('------NSE LATEST CA------');
      Response response = await Dio().get(url);

      for (var ca in response.data['ca']) {
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

class McCompanyCa {
  Future<List<McCa>> getCompanyCa(String code) async {
    String url = Endpoints.baseUrl + Endpoints.companyMcCa + code;
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
            bcStartDate: ca['bc_start_date'],
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
