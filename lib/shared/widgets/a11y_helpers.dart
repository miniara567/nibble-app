import 'package:flutter/material.dart';

class FocusIndicators {
  const FocusIndicators._();

  static OutlineInputBorder outline(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: 2),
      );
}

/// Utility widget to wrap tappable components with minimum size and semantics.
class AccessibleTapRegion extends StatelessWidget {
  const AccessibleTapRegion({
    super.key,
    required this.onTap,
    required this.child,
    this.semanticLabel,
  });

  final VoidCallback onTap;
  final Widget child;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    );
  }
}
