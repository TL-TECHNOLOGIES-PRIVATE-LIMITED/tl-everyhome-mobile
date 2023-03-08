import 'dart:developer';

import 'package:every_home/domain/dummy/database/dummy_data.dart';
import 'package:every_home/domain/dummy/models/dummy_bussines_model.dart';
import 'package:every_home/domain/dummy/models/dummy_customer_model.dart';
import 'package:every_home/domain/dummy/models/dummy_worker_model.dart';

class DBFunction {
  List<DummyCustomer> fetchCustomer() {
    var response = dummyCustomerFromJson(dummyCustomerEncoded);

    log(response[1].name.toString());
    return response;
  }

  List<DummyBussiness> fetchBusiness() {
    var response = dummyBussinessFromJson(dummyBussinessEncoded);

    log(response[1].name.toString());
    return response;
  }

  List<DummyWorker> fetchWorker() {
    var response = dummyWorkerFromJson(dummyWorkerEncoded);

    log(response[1].name.toString());
    return response;
  }
}
