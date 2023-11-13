import 'dart:async';

import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/domains/address/repository/address_repository.dart';
import 'package:agu_meetup_mobile/domains/event/repository/event_repository.dart';
import 'package:agu_meetup_mobile/domains/user/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class BottomBarModelView extends ChangeNotifier {
  bool isPageLoaded = false;
  int currentBarIndex = 0;
  final _isCurrentBarIndex = StreamController<int>.broadcast();

  Stream<int> get loadingStatus async* {
    yield currentBarIndex;
    yield* _isCurrentBarIndex.stream;
  }

  void changeBarIndex(int newBarIndex) {
    currentBarIndex = newBarIndex;
    _isCurrentBarIndex.add(newBarIndex);
    notifyListeners();
  }

  /// Home Button Components
  String homeButtonActiveIcon = homeButtonActive;
  String homeButtonPassiveIcon = homeButtonPassive;

  /// Search Button Components
  String searchButtonActiveIcon = searchButtonActive;
  String searchButtonPassiveIcon = searchButtonPassive;

  /// Notification Button Components
  String notificationButtonActiveIcon = notificationButtonActive;
  String notificationButtonPassiveIcon = notificationButtonPassive;

  /// Profile Button Components
  String profileButtonActiveIcon = profileButtonActive;
  String profileButtonPassiveIcon = profileButtonPassive;

  ///*** Methods initialize before app ***///
  /// Repositories
  EventRepository eventRepository = EventRepository();
  UserRepository userRepository = UserRepository();
  AddressRepository addressRepository = AddressRepository();

  void initializeMethods() async{
    isPageLoaded = false;
    await fetchBookmarksEventIds();
    await fetchMyEvents();
    // await fetchJoinedEvents();
    await fetchClosestLocationsName();
    isPageLoaded = true;
    notifyListeners();
  }

  Future<void> fetchBookmarksEventIds() async {
    await eventRepository
        .fetchBookmarksEventIdsFromDS(userRepository.getUserInfo()!.id);
  }

  Future<void> fetchMyEvents() async {
    await eventRepository.fetchMyEventsFromDS(userRepository.getUserInfo()!.id);
  }

  Future<void> fetchJoinedEvents() async {
    await eventRepository.fetchJoinedEventsFromDS(userRepository.getUserInfo()!.id);
  }

  Future<void> fetchClosestLocationsName() async {
    try {
      Position currentPosition = await _determinePosition();
      await addressRepository.getClosestLocationName(lat: currentPosition.latitude, long: currentPosition.longitude);
    } catch(e) {
      // await addressRepository.getClosestLocationName(lat: -1, long: -1);
      print(e);
    }

  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
