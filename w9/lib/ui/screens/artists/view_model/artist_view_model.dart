import 'package:flutter/material.dart';
import '../../../../model/artists/artists.dart';
import '../../../../data/repositories/artists/artist_repository.dart';
class ArtistViewModel extends ChangeNotifier {
  final ArtistRepository repository;

  List<Artist> artists = [];
  bool isLoading = true;
  String? error;

  ArtistViewModel({required this.repository}) {
    fetchArtists();
  }

  Future<void> fetchArtists() async {
    isLoading = true;
    notifyListeners();

    try {
      artists = await repository.fetchArtists();
      error = null;
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}