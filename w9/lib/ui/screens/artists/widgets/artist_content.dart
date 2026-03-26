import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/artist_view_model.dart';
import '../../../../ui/widgets/artists/artist_tile.dart';
import '../../../theme/theme.dart';


class ArtistsContent extends StatelessWidget {
  const ArtistsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final mv = context.watch<ArtistViewModel>();

    Widget content;

    if (mv.isLoading) {
      content = const Center(child: CircularProgressIndicator());
    } else if (mv.error != null) {
      content = Center(
        child: Text(
          'Error: ${mv.error}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    } else {
      final artists = mv.artists;
      content = ListView.builder(
        itemCount: artists.length,
        itemBuilder: (context, index) {
          final artist = artists[index];
          return ArtistTile(artist: artist);
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text("Artists", style: AppTextStyles.heading),
          const SizedBox(height: 50),
          Expanded(child: content),
        ],
      ),
    );
  }
}
