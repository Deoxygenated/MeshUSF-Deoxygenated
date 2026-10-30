import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshcore_open/theme/mesh_theme.dart';

void main() {
  const primary = Color(0xFF006747);
  const secondary = Color(0xFFCFC493);

  test('custom colors drive prominent light theme accents', () {
    final theme = MeshTheme.light(
      primaryColor: primary,
      secondaryColor: secondary,
    );

    expect(theme.colorScheme.primary, primary);
    expect(theme.colorScheme.secondary, secondary);
    expect(theme.colorScheme.primaryContainer, isNot(primary));
    expect(theme.appBarTheme.iconTheme?.color, primary);
    expect(
      theme.navigationBarTheme.indicatorColor,
      theme.colorScheme.primaryContainer,
    );
    expect(theme.floatingActionButtonTheme.backgroundColor, primary);
    expect(
      theme.elevatedButtonTheme.style?.backgroundColor?.resolve({}),
      primary,
    );
  });

  test('custom colors tint dark theme containers and chat surfaces', () {
    final theme = MeshTheme.dark(
      primaryColor: primary,
      secondaryColor: secondary,
    );

    expect(theme.colorScheme.primary, primary);
    expect(theme.colorScheme.secondary, secondary);
    expect(theme.colorScheme.primaryContainer, isNot(Colors.transparent));
    expect(
      theme.colorScheme.primaryContainer,
      isNot(theme.colorScheme.surface),
    );
    expect(theme.colorScheme.onPrimaryContainer, isNot(Colors.transparent));
    expect(theme.appBarTheme.actionsIconTheme?.color, secondary);
  });
}
