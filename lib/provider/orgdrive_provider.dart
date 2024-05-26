import 'package:flutter/material.dart';
import 'package:flutter_project/model/org_model.dart';

class OrganizationProvider extends ChangeNotifier {
  final bool _isLoading = false;
  final List<Organizations> _orgdrives = [
      Organizations(
      id: 1,
      image: "assets/images/org1.jpg",
      name: "Family Search Organization Clothing Drives",
      description: "Angat Buhay Foundation, incorporated as Angat Pinas, Inc., is a non-profit, non-governmental organization based in the Philippines. It was founded and officially launched on July 1, 2022, a day after its founder Leni Robredo's term as Vice President of the Philippines expired.",
      status: true
    ),

    Organizations(
      id: 2,
      image: "assets/images/org1.jpg",
      name: "Angat Buhay Food Drives",
      description: "Angat Buhay Foundation, incorporated as Angat Pinas, Inc., is a non-profit, non-governmental organization based in the Philippines. It was founded and officially launched on July 1, 2022, a day after its founder Leni Robredo's term as Vice President of the Philippines expired.",
      status: true
    ),

    Organizations(
      id: 3,
      image: "assets/images/org1.jpg",
      name: "Women's Development Fundraising",
      description: "Angat Buhay Foundation, incorporated as Angat Pinas, Inc., is a non-profit, non-governmental organization based in the Philippines. It was founded and officially launched on July 1, 2022, a day after its founder Leni Robredo's term as Vice President of the Philippines expired.",
      status: true
    )
  ];

  bool get isLoading => _isLoading;
  List<Organizations> get orgdrives => _orgdrives;

  void addDonation(Organizations newDonationDrive) {
    _orgdrives.add(newDonationDrive);
    notifyListeners();
  }

  void editDrive(int index, Organizations updatedDrive) {
    _orgdrives[index] = updatedDrive;
    notifyListeners();
  }

  void deleteDrive(int id) {
    for (int i = 0; i < _orgdrives.length; i++) {
      if (_orgdrives[i].id == id) {
        _orgdrives.removeAt(i);
        break;
      }
    }
    notifyListeners();
  }

}
