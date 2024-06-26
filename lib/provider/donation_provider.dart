import 'package:flutter/material.dart';
import 'package:flutter_project/api/donation_api.dart';
import 'package:flutter_project/model/donation_model.dart';

class DonationProvider extends ChangeNotifier {
  final DonationApi donationApi = DonationApi();
  bool _isLoading = false;
  List<Donation> _donations = [
    // Donation(
    //   id: 7984656454,
    //   items: ['Clothes', 'Cash'],
    //   logistics: 'Pick up',
    //   address: 'Los Banos, Laguna',
    //   phoneNum: '09123456789',
    //   date: 'May 31, 2024',
    //   time: '8:00 AM',
    //   status: 'Pending'
    // ),
    // Donation(
    //   id: 995234965,
    //   items: ['Food', 'Others'],
    //   logistics: 'Drop-off',
    //   date: 'June 11, 2024',
    //   time: '01:30 PM',
    //   status: 'Pending'
    // ),
    // Donation(
    //   id: 012534588,
    //   items: ['Necessities'],
    //   logistics: 'Pick up',
    //   address: 'Calamba, Laguna',
    //   phoneNum: '09987456321',
    //   date: 'July 27, 2024',
    //   time: '10:00 AM',
    //   status: 'Pending'
    // ),
  ];

  bool get isLoading => _isLoading;
  List<Donation> get donations => _donations;

  void addDonation(Donation newDonation) async {
    _isLoading = true;
    notifyListeners();

    try {
      await donationApi.addDonation(newDonation);
      // _donations.add(newDonation);
    } catch (e) {
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchDonations() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<Donation> fetchedDonations = await donationApi.fetchDonations();
      // print("===============");
      // print(fetchedDonations);
      _donations = fetchedDonations;
    } catch (e) {
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCurrentUserDonations(String username) async {
    _isLoading = true;
    notifyListeners();

    try {
      List<Donation> fetchedDonations = await donationApi.fetchDonationsByUsername(username);
      _donations = fetchedDonations;
    } catch (e) {
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchDonationsByOrganizationName(String username) async {
    _isLoading = true;
    notifyListeners();

    try {
      List<Donation> fetchedDonations = await donationApi.fetchDonationsByOrganization(username);
      _donations = fetchedDonations;
    } catch (e) {
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }

  Donation? findDonationById(String id) {
    for (var donation in _donations) {
      if (donation.id == id) {
        return donation;
      }
    }
    return null;
  }

  void editDropOffStatus(int id, String status) async {
    try {
      await donationApi.editDropOffStatus(id, status);
      notifyListeners();
    }catch (e) {
      return;
    }
    notifyListeners();
  }

  void cancelDonation(int id) async {
    try {
      await donationApi.cancelDonation(id);
      notifyListeners();
    }catch (e) {
      return;
    }
    notifyListeners();
  }

  void editDonation(int id, Donation newDonation) async {
    _isLoading = true;
    notifyListeners();
    try {
      await donationApi.editDonation(id, newDonation.toJson(newDonation));
    } catch (e) {
      return;
    }
    _isLoading = false;
    notifyListeners();
  }
}
