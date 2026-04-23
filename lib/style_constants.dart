import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NetflixStyles {
  // COLORES OFICIALES
  static const Color blackBg = Color(0xFF000000);
  static const Color redNetflix = Color(0xFFE50914);
  static const Color white = Colors.white;
  static const Color greyText = Color(0xFFAAAAAA);
  static const Color cardBg = Color(0xFF141414);

  // ESTRUCTURA TV (Netflix Standard)
  static const double sidebarWidth = 100.0;
  static const double sidebarExpandedWidth = 260.0;
  static const double horizontalPadding = 60.0;

  // FUENTES (Netflix Sans Look)
  static TextStyle titleMain = GoogleFonts.geologica(
    fontSize: 80.0,
    fontWeight: FontWeight.w900,
    color: white,
    height: 1.0,
    letterSpacing: -3.0,
  );

  static TextStyle bodyRegular = GoogleFonts.inter(
    fontSize: 22.0,
    color: white.withOpacity(0.9),
    height: 1.4,
  );

  static TextStyle badge = GoogleFonts.inter(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 4.0,
    color: white,
  );

  static TextStyle rowTitle = GoogleFonts.inter(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: white,
  );

  // DEGRADADOS CINEMATOGRÁFICOS
  static const LinearGradient mainOverlay = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Colors.black,
      Colors.black87,
      Colors.black54,
      Colors.transparent,
    ],
    stops: [0.0, 0.2, 0.5, 0.8],
  );

  static const LinearGradient bottomOverlay = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.center,
    colors: [
      Colors.black,
      Color(0xCC000000), // Negro al 80%
      Colors.transparent,
    ],
    stops: [0.0, 0.3, 1.0],
  );

  // SOMBRAS DE PROFUNDIDAD
  static List<Shadow> textShadows = [
    const Shadow(
      color: Color(0xE6000000), // Negro al 90%
      offset: Offset(0, 4),
      blurRadius: 12,
    ),
  ];

  // ESTILO TOP 10 (Números gigantes)
  static TextStyle top10Number = GoogleFonts.geologica(
    fontSize: 140.0,
    fontWeight: FontWeight.w900,
    color: Colors.transparent,
  ).copyWith(
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = Colors.white.withOpacity(0.5),
  );

  static TextStyle headerNav = GoogleFonts.inter(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: white.withOpacity(0.8),
  );

  // VIÑETEADO (Vignette)
  static RadialGradient vignette = RadialGradient(
    center: Alignment.center,
    radius: 1.5,
    colors: [
      Colors.transparent,
      Colors.black.withOpacity(0.5),
    ],
    stops: const [0.6, 1.0],
  );

  // LOGO N ORIGINAL
  static TextStyle logoN = GoogleFonts.bebasNeue(
    fontSize: 24.0,
    color: redNetflix,
    letterSpacing: -1,
  );

  static TextStyle brandLogo = GoogleFonts.bebasNeue(
    fontSize: 42.0,
    color: redNetflix,
    letterSpacing: 2,
  );

  static const Color matchGreen = Color(0xFF46D369);

  static BoxDecoration newTagStyle = BoxDecoration(
    color: const Color(0xFFE50914),
    borderRadius: BorderRadius.circular(2),
  );

  static BoxDecoration ribbonStyle = BoxDecoration(
    color: redNetflix,
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 4, offset: const Offset(2, 2)),
    ],
  );

  static BoxDecoration reflectionEffect = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white.withOpacity(0.1),
        Colors.transparent,
      ],
    ),
  );

  static BoxDecoration badgeStyle = BoxDecoration(
    border: Border.all(color: Colors.white38, width: 1),
    borderRadius: BorderRadius.circular(2),
  );

  static const Color eliteGold = Color(0xFFFFD700);

  static TextStyle genreText = GoogleFonts.inter(
    fontSize: 16,
    color: Colors.white70,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  static TextStyle eliteBadge = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Colors.white70,
  );
}
