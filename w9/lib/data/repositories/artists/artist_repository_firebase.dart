import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/artists/artists.dart';
import '../../dtos/artist_dto.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistsUri = Uri.https(
    'week9-8bc45-default-rtdb.firebaseio.com',
    '/artists.json',
  );

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of artists
      final Map<String, dynamic> artistJson = json.decode(response.body);
      return artistJson.entries.map((entry) {
        return ArtistDto.fromJson(
          entry.key,
          Map<String, dynamic>.from(entry.value),
        );
      }).toList();
    } else {
      throw Exception('Failed to load artists');
    }
  }

  @override
  Future<Artist?> fetchArtistById(String id) async {
    final artists = await fetchArtists();
    try {
      return artists.firstWhere((artist) => artist.id == id);
    } catch (e) {
      return null;
    }
  }
}
