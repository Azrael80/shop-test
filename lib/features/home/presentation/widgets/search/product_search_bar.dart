import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Theme.of(context).primaryColor,
            const Color(0xFF62929E),
          ],
          stops: const [0.4, 1.0],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5.0,
          ),
        ],
      ),
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 8.0,
        bottom: 15.0,
      ),
      child: _buildTextField(Theme.of(context)),
    );
  }

  /// Créer le champ de recherche.
  Widget _buildTextField(ThemeData theme) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.6),
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: Colors.grey,
        hintText: 'Rechercher...',
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1.5, color: theme.colorScheme.secondary),
        ),
        contentPadding: const EdgeInsets.all(0.0),
      ),
    );
  }
}
