import 'dart:async';
import 'package:boozinmachinetask/data/model/boozin_data_model.dart';
import 'package:boozinmachinetask/data/service/google_fit_api_service.dart';
import 'package:get/get.dart';

class BoozinHealthController extends GetxController {
  final BoozinApiService apiService = BoozinApiService();

  final RxList<BoozinDataModel> fitnessDataList = <BoozinDataModel>[].obs;
  final RxBool isLoading = RxBool(true);

  @override
  void onInit() {
    super.onInit();
    _fetchFitnessData();
    //_startStepTracking();
  }

  Future<void> _fetchFitnessData() async {
    try {
      isLoading.value = true;
      fitnessDataList.value = await apiService.fetchBoozinData();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch fitness data');
    } finally {
      isLoading.value = false;
    }
  }
}
