import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flowyvision/style_constants.dart';

class NetflixHomeScreen extends StatefulWidget {
  const NetflixHomeScreen({super.key});

  @override
  State<NetflixHomeScreen> createState() => _NetflixHomeScreenState();
}

class _NetflixHomeScreenState extends State<NetflixHomeScreen> {
  bool isSidebarExpanded = false;
  
  // USANDO UN PROXY DE CLOUDINARY PARA SALTAR CUALQUIER BLOQUEO DE SEGURIDAD DEL TV
  String currentHeroImage = 'https://res.cloudinary.com/demo/image/fetch/f_auto,q_auto/https://i.imgur.com/E0nZ9a9.jpg'; 
  String currentTitle = "THE WITCHER";
  String currentDescription = "Geralt de Rivia, un cazador de monstruos mutante, viaja hacia su destino en un mundo turbulento donde las personas a menudo son más perversas que las bestias.";
  String currentGenres = "Suspenso • Fantasía • Dramas de TV";

  void _updateHero(Map<String, String> item) {
    if (currentHeroImage != item['bg']) {
      setState(() {
        currentHeroImage = item['bg']!;
        currentTitle = item['title']!;
        currentDescription = item['desc']!;
        currentGenres = item['genres']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. FONDO (ESTÁTICO Y DIRECTO PARA EVITAR ERRORES DE RENDERIZADO)
          Positioned.fill(
            child: Image.network(
              currentHeroImage, 
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: double.infinity,
              gaplessPlayback: true,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.red[900], 
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 40),
                      const SizedBox(height: 10),
                      Text("ERROR: $error", style: const TextStyle(color: Colors.white, fontSize: 10)),
                    ],
                  )
                ),
              ),
            ),
          ),

          // 2. VIGNETTES (MÁS SUAVES PARA NO TAPAR LA IMAGEN)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.4), Colors.transparent, Colors.black.withOpacity(0.9)],
                  stops: const [0.0, 0.3, 1.0]
                )
              )
            )
          ),

          // 3. ESTRUCTURA
          Row(
            children: [
              _buildSidebar(),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 40),
                  children: [
                    _buildBrandHeader(),
                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: _buildHeroSection(),
                    ),

                    const SizedBox(height: 60),

                    _buildTop10Row("Top 10 en Argentina hoy", [
                      {
                        'poster': 'https://image.tmdb.org/t/p/w500/8Gxv0vS9UyiUGX7j9pqiSfy1pgo.jpg', 
                        'bg': 'https://res.cloudinary.com/demo/image/fetch/f_auto,q_auto/https://i.imgur.com/8QG7rY9.jpg', // Lupin
                        'title': 'LUPIN', 
                        'desc': 'Assane Diop se propone vengar a su padre, injustamente acusado de un crimen por una familia adinerada.', 
                        'genres': 'Crimen • Suspenso • Acción'
                      },
                      {
                        'poster': 'https://image.tmdb.org/t/p/w500/7WsyChvLEno31ZUEwO5WkyS36Wp.jpg', 
                        'bg': 'https://res.cloudinary.com/demo/image/fetch/f_auto,q_auto/https://i.imgur.com/m9Y9S88.jpg', // Cobra Kai
                        'title': 'COBRA KAI', 
                        'desc': 'Treinta años después de su pelea final, la rivalidad entre Johnny y Daniel vuelve a encenderse.', 
                        'genres': 'Artes Marciales • Drama • Comedia'
                      },
                      {
                        'poster': 'https://image.tmdb.org/t/p/w500/m9Y9S88v9Uq8RzLdfYV6Xp9T4YI.jpg', 
                        'bg': 'https://res.cloudinary.com/demo/image/fetch/f_auto,q_auto/https://i.imgur.com/m9Y9S88.jpg', // One Piece
                        'title': 'ONE PIECE', 
                        'desc': 'Luffy y su tripulación de piratas navegan por el Grand Line en busca del tesoro legendario.', 
                        'genres': 'Aventura • Fantasía • Acción'
                      },
                    ]),

                    _buildGalleryRow("Tendencias ahora", [
                      {
                        'poster': 'https://image.tmdb.org/t/p/w500/uDzyEG9u9v792pDY4nxPBqS9Ktv.jpg', 
                        'bg': 'https://res.cloudinary.com/demo/image/fetch/f_auto,q_auto/https://i.imgur.com/E0nZ9a9.jpg', // Stranger Things
                        'title': 'STRANGER THINGS', 
                        'desc': 'Un grupo de niños descubre que hay fuerzas sobrenaturales en su pequeño pueblo.', 
                        'genres': 'Ciencia Ficción • Misterio • Terror'
                      },
                      {
                        'poster': 'https://image.tmdb.org/t/p/w500/iS61vC6I412N9m1644M5gH4N5gO.jpg', 
                        'bg': 'https://res.cloudinary.com/demo/image/fetch/f_auto,q_auto/https://i.imgur.com/8QG7rY9.jpg', // Berlín
                        'title': 'BERLÍN', 
                        'desc': 'Andrés de Fonollosa planea un robo maestro de 44 millones de euros en París.', 
                        'genres': 'Atraco • Drama • Crimen'
                      },
                    ], isOriginal: true, isNew: true),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Focus(
      onFocusChange: (v) => setState(() => isSidebarExpanded = v),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isSidebarExpanded ? 240 : 80,
        color: Colors.black.withOpacity(isSidebarExpanded ? 0.95 : 0.0),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: isSidebarExpanded ? 25 : 0, sigmaY: isSidebarExpanded ? 25 : 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _sideItem(Icons.search, "Buscar"),
                _sideItem(Icons.home, "Inicio", active: true),
                _sideItem(Icons.live_tv, "En vivo"),
                _sideItem(Icons.movie, "Películas"),
                _sideItem(Icons.add, "Mi lista"),
                const Spacer(),
                const Icon(Icons.account_circle, color: Colors.white, size: 32),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sideItem(IconData icon, String label, {bool active = false}) {
    return Focus(
      child: Builder(
        builder: (context) {
          final bool hasFocus = Focus.of(context).hasFocus;
          return AnimatedScale(
            scale: hasFocus ? 1.2 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              color: hasFocus ? Colors.white10 : Colors.transparent,
              child: Row(
                children: [
                  Icon(icon, color: hasFocus || active ? Colors.white : Colors.white38, size: 28),
                  if (isSidebarExpanded) ...[
                    const SizedBox(width: 20),
                    Text(label, style: TextStyle(color: hasFocus || active ? Colors.white : Colors.white38, fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBrandHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: Row(
        children: [
          Text("FLOWY", style: NetflixStyles.brandLogo.copyWith(fontSize: 48)),
          const SizedBox(width: 60),
          _navItem("Series", true),
          const SizedBox(width: 40),
          _navItem("Películas", false),
        ],
      ),
    );
  }

  Widget _navItem(String text, bool active) {
    return Column(
      children: [
        Text(text, style: NetflixStyles.headerNav.copyWith(color: active ? Colors.white : Colors.white60, fontSize: 20)),
        if (active) Container(
          margin: const EdgeInsets.only(top: 6), 
          height: 3, width: 35, 
          decoration: BoxDecoration(color: NetflixStyles.redNetflix, boxShadow: [BoxShadow(color: NetflixStyles.redNetflix.withOpacity(0.5), blurRadius: 10)])
        ),
      ],
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(padding: const EdgeInsets.all(4), color: NetflixStyles.redNetflix, child: const Icon(Icons.trending_up, color: Colors.white, size: 16)),
            const SizedBox(width: 8),
            const Text("N.º 1 EN ARGENTINA HOY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2)),
          ],
        ),
        const SizedBox(height: 25),
        Text(currentTitle, style: NetflixStyles.titleMain.copyWith(fontSize: 85, letterSpacing: -2, shadows: [const Shadow(color: Colors.black, blurRadius: 40, offset: Offset(5, 5))])),
        const SizedBox(height: 15),
        Row(
          children: [
            const Text("98% de coincidencia", style: TextStyle(color: NetflixStyles.matchGreen, fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(width: 20),
            const Text("2024", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(width: 20),
            _badgeMeta("16+"),
            const SizedBox(width: 20),
            _eliteBadge("4K"),
            const SizedBox(width: 8),
            _eliteBadge("HDR"),
            const SizedBox(width: 8),
            _eliteBadge("VISION"),
            const SizedBox(width: 8),
            _eliteBadge("ATMOS"),
          ],
        ),
        const SizedBox(height: 25),
        Text(currentGenres, style: NetflixStyles.genreText),
        const SizedBox(height: 20),
        SizedBox(width: 650, child: Text(currentDescription, style: NetflixStyles.bodyRegular.copyWith(fontSize: 22, height: 1.4, shadows: [const Shadow(color: Colors.black, blurRadius: 30)]))),
        const SizedBox(height: 50),
        Row(
          children: [
            _actionButton("Reproducir", Icons.play_arrow, Colors.white, Colors.black),
            const SizedBox(width: 20),
            _actionButton("Más información", Icons.info_outline, Colors.white.withOpacity(0.2), Colors.white),
            const SizedBox(width: 20),
            _circleBtn(Icons.add),
          ],
        ),
      ],
    );
  }

  Widget _circleBtn(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white54, width: 2), color: Colors.black38),
      child: Icon(icon, color: Colors.white, size: 28),
    );
  }

  Widget _actionButton(String label, IconData icon, Color bg, Color tc) {
    return Focus(
      child: Builder(
        builder: (context) {
          final bool hasFocus = Focus.of(context).hasFocus;
          return AnimatedScale(
            scale: hasFocus ? 1.1 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              decoration: BoxDecoration(
                color: hasFocus ? Colors.white : bg,
                borderRadius: BorderRadius.circular(4),
                boxShadow: hasFocus ? [BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 40)] : null,
              ),
              child: Row(
                children: [
                  Icon(icon, color: hasFocus ? Colors.black : tc, size: 32),
                  const SizedBox(width: 12),
                  Text(label, style: TextStyle(color: hasFocus ? Colors.black : tc, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _badgeMeta(String t) {
    return Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(border: Border.all(color: Colors.white38), borderRadius: BorderRadius.circular(2)), child: Text(t, style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold)));
  }

  Widget _eliteBadge(String t) {
    return Container(padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1), decoration: BoxDecoration(border: Border.all(color: Colors.white38), borderRadius: BorderRadius.circular(2)), child: Text(t, style: const TextStyle(color: Colors.white60, fontSize: 10, fontWeight: FontWeight.bold)));
  }

  Widget _buildTop10Row(String title, List<Map<String, String>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        Padding(padding: const EdgeInsets.only(left: 60), child: Text(title, style: NetflixStyles.rowTitle)),
        const SizedBox(height: 20),
        SizedBox(
          height: 240,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 60),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) => _tvTop10Card(index + 1, data[index]),
          ),
        ),
      ],
    );
  }

  Widget _tvTop10Card(int rank, Map<String, String> item) {
    return Focus(
      onFocusChange: (v) { if (v) _updateHero(item); },
      child: Builder(
        builder: (context) {
          final bool hasFocus = Focus.of(context).hasFocus;
          return Container(
            width: 200,
            margin: const EdgeInsets.only(right: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Text("$rank", style: NetflixStyles.top10Number.copyWith(fontSize: 220, color: hasFocus ? Colors.white24 : Colors.white12)),
                Positioned(
                  left: 65, top: 10, bottom: 10,
                  child: AnimatedScale(
                    scale: hasFocus ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: hasFocus ? Border.all(color: Colors.white, width: 3) : null,
                        image: DecorationImage(image: NetworkImage(item['poster']!), fit: BoxFit.cover),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.9), blurRadius: 25)],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildGalleryRow(String title, List<Map<String, String>> data, {bool isOriginal = false, bool isNew = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        Padding(padding: const EdgeInsets.only(left: 60), child: Text(title, style: NetflixStyles.rowTitle)),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 60),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) => _tvMovieCard(data[index], isOriginal, isNew),
          ),
        ),
      ],
    );
  }

  Widget _tvMovieCard(Map<String, String> item, bool isOriginal, bool isNew) {
    return Focus(
      onFocusChange: (v) { if (v) _updateHero(item); },
      child: Builder(
        builder: (context) {
          final bool hasFocus = Focus.of(context).hasFocus;
          return Column(
            children: [
              AnimatedScale(
                scale: hasFocus ? 1.15 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: 160, height: 230,
                  margin: const EdgeInsets.only(right: 25, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: hasFocus ? Border.all(color: Colors.white, width: 3) : null,
                    image: DecorationImage(image: NetworkImage(item['poster']!), fit: BoxFit.cover),
                    boxShadow: hasFocus ? [BoxShadow(color: Colors.white.withOpacity(0.2), blurRadius: 25)] : [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10)],
                  ),
                  child: Stack(
                    children: [
                      if (isOriginal) Positioned(top: 0, left: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2), decoration: NetflixStyles.ribbonStyle, child: Text("N", style: NetflixStyles.logoN))),
                      if (isNew) Positioned(bottom: 0, left: 0, right: 0, child: Container(padding: const EdgeInsets.symmetric(vertical: 6), color: NetflixStyles.redNetflix, child: const Center(child: Text("NUEVA TEMPORADA", style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))))),
                    ],
                  ),
                ),
              ),
              if (hasFocus) Container(width: 160, height: 10, margin: const EdgeInsets.only(right: 25), decoration: NetflixStyles.reflectionEffect),
            ],
          );
        },
      ),
    );
  }
}
