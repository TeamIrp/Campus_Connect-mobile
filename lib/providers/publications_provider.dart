import 'package:flutter/material.dart';
import '../models/publications_model.dart';
import '../service/api_services.dart';
import '../utils/show_toast.dart';

class PublicationsProvider with ChangeNotifier {

  PublicationsList? _publicationsList;

  bool _isLoading = false;

  PublicationsList? get subscriptionsList => _publicationsList;

  bool get isLoading => _isLoading;

  Future<void> getPublications(BuildContext context, String token) async {
    _isLoading = true;
    notifyListeners();
    try {
      _publicationsList = await ApiService.getPublications(context, token);

      if (_publicationsList?.statusCode == 200 && _publicationsList?.status == true) {
        ShowToast.showToastSuccess(_publicationsList!.message.toString());
      } else if (_publicationsList?.statusCode == 400 &&  _publicationsList?.status == false) {
        ShowToast.showToastError(_publicationsList!.message.toString());
        notifyListeners();
      } else {
        ShowToast.showToastError(_publicationsList!.errorMsg.toString());
      }
    } catch (e) {
      ShowToast.showToastError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
