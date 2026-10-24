import 'package:flutter/material.dart';

class PrototypeBanner extends StatelessWidget {
  const PrototypeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      container: true,
      label:
          'Practice prototype. Do not enter real relationship information. Nothing is saved after you close the app.',
      child: Material(
        color: scheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline, color: scheme.onSecondaryContainer),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Practice prototype. Do not enter real relationship information. Nothing is saved after you close the app.',
                  style: TextStyle(
                    color: scheme.onSecondaryContainer,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
