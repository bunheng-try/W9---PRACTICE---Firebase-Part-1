import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w9/data/repositories/artists/artist_repository.dart';
import 'package:w9/ui/screens/artists/view_model/artist_view_model.dart';
import 'package:w9/ui/screens/artists/widgets/artist_content.dart';

class ArtistsScreen extends StatelessWidget {
  const ArtistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          ArtistViewModel(repository: context.read<ArtistRepository>()),
      child: const ArtistsContent(),
    );
  }
}
