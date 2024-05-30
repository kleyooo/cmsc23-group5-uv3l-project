import 'package:flutter/material.dart';
import 'package:flutter_project/model/org_model.dart';

class OrganizationProvider extends ChangeNotifier {
  final bool _isLoading = false;
  List<Organizations> _orgdrives = [];

  List<Organizations> _filteredOrgdrives = [];

  OrganizationProvider() {
    _orgdrives = [
      Organizations(
          id: 1,
          image: "assets/images/org1.jpg",
          name: "Red Cross Youth",
          description:
              "Angat Buhay Foundation, incorporated as Angat Pinas, Inc., is a non-profit, non-governmental organization based in the Philippines. It was founded and officially launched on July 1, 2022, a day after its founder Leni Robredo's term as Vice President of the Philippines expired.",
          status: true,
          type: "Health"),
      Organizations(
          id: 2,
          image: "assets/images/org1.jpg",
          name: "EmpowerHope Foundation",
          description:
              "Angat Buhay Foundation, incorporated as Angat Pinas, Inc., is a non-profit, non-governmental organization based in the Philippines. It was founded and officially launched on July 1, 2022, a day after its founder Leni Robredo's term as Vice President of the Philippines expired.",
          status: true,
          type: "Non-Profit"),
      Organizations(
          id: 3,
          image: "assets/images/org1.jpg",
          name: "BrighterTomorrows Initiative",
          description:
              "Angat Buhay Foundation, incorporated as Angat Pinas, Inc., is a non-profit, non-governmental organization based in the Philippines. It was founded and officially launched on July 1, 2022, a day after its founder Leni Robredo's term as Vice President of the Philippines expired.",
          status: true,
          type: "Academic"),
      Organizations(
          id: 4,
          image: "assets/images/org1.jpg",
          name: "Harmony Haven Charity",
          description:
              "Angat Buhay Foundation, incorporated as Angat Pinas, Inc., is a non-profit, non-governmental organization based in the Philippines. It was founded and officially launched on July 1, 2022, a day after its founder Leni Robredo's term as Vice President of the Philippines expired.",
          status: true,
          type: "Religious"),
      Organizations(
          id: 5,
          image: "assets/images/org1.jpg",
          name: "Miracle Makers Alliance",
          description:
              "Angat Buhay Foundation, incorporated as Angat Pinas, Inc., is a non-profit, non-governmental organization based in the Philippines. It was founded and officially launched on July 1, 2022, a day after its founder Leni Robredo's term as Vice President of the Philippines expired.",
          status: true,
          type:"Non-Profit"),
      Organizations(
          id: 6,
          image: "assets/images/org1.jpg",
          name: "Impact Igniters Society",
          description:
              "Angat Buhay Foundation, incorporated as Angat Pinas, Inc., is a non-profit, non-governmental organization based in the Philippines. It was founded and officially launched on July 1, 2022, a day after its founder Leni Robredo's term as Vice President of the Philippines expired.",
          status: true,
          type: "Others")
    ];
    _filteredOrgdrives = _orgdrives;
  }

  bool get isLoading => _isLoading;

  List<Organizations> get orgdrives => _filteredOrgdrives; 

  void filterOrganizationsByCategory(String category) {
    _filteredOrgdrives = _orgdrives.where((org) => org.type == category).toList();
    notifyListeners();
  }

}
