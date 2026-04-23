import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flowyvision/style_constants.dart';

class NetflixHomeScreen extends StatefulWidget {
  const NetflixHomeScreen({super.key});

  @override
  State<NetflixHomeScreen> createState() => _NetflixHomeScreenState();
}

class _NetflixHomeScreenState extends State<NetflixHomeScreen> {
  Timer? _trailerTimer;
  
  String currentBg = 'https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?q=60&w=1200';
  String currentTitle = 'THE WITCHER';
  String currentDescription = 'Geralt de Rivia, un cazador de monstruos mutante, viaja hacia su destino en un mundo turbulento donde las personas a menudo son más perversas que las bestias.';
  String currentGenres = 'Suspenso • Fantasía • Dramas de TV';
  bool isSidebarExpanded = false;

  final List<Map<String, String>> _allContent = [
    {
      'poster': 'https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?q=80&w=400', 
      'bg': 'https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?q=60&w=1200',
      'title': 'THE WITCHER', 
      'desc': 'Geralt de Rivia, un cazador de monstruos mutante, viaja hacia su destino en un mundo turbulento.', 
      'genres': 'Fantasía • Acción • Drama',
    },
    {
      'poster': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=400', 
      'bg': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=60&w=1200',
      'title': 'LUPIN', 
      'desc': 'Assane Diop se propone vengar a su padre por una injusticia cometida por una familia adinerada.', 
      'genres': 'Crimen • Suspenso • Acción',
    },
    {
      'poster': 'https://images.unsplash.com/photo-1552072805-2a9039d00e57?q=80&w=400', 
      'bg': 'https://images.unsplash.com/photo-1552072805-2a9039d00e57?q=60&w=1200',
      'title': 'COBRA KAI', 
      'desc': 'Treinta años después de su pelea final, Johnny Lawrence busca redención abriendo un dojo de karate.', 
      'genres': 'Artes Marciales • Drama • Comedia',
    },
    {
      'poster': 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=400', 
      'bg': 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=60&w=1200',
      'title': 'EL JUEGO DEL CALAMAR', 
      'desc': 'Cientos de personas con dificultades económicas aceptan una extraña invitación a juegos infantiles.', 
      'genres': 'Thriller • Drama • Acción'
    },
    {
      'poster': 'https://images.unsplash.com/photo-1509248961158-e54f6934749c?q=80&w=400', 
      'bg': 'https://images.unsplash.com/photo-1509248961158-e54f6934749c?q=60&w=1200',
      'title': 'STRANGER THINGS', 
      'desc': 'La desaparición de un niño desata una serie de eventos sobrenaturales en Hawkins.', 
      'genres': 'Ciencia Ficción • Misterio • Terror'
    },
    {
      'poster': 'https://images.unsplash.com/photo-1533928298208-27ff66555d8d?q=80&w=400', 
      'bg': 'https://images.unsplash.com/photo-1533928298208-27ff66555d8d?q=60&w=1200',
      'title': 'BATMAN', 
      'desc': 'El caballero de la noche lucha contra el crimen en Gotham City.', 
      'genres': 'Acción • Crimen • Drama'
    },
    {
      'poster': 'https://images.unsplash.com/photo-1621609764180-2ca554a9d6f2?q=80&w=400', 
      'bg': 'https://images.unsplash.com/photo-1621609764180-2ca554a9d6f2?q=60&w=1200',
      'title': 'GLADIATOR', 
      'desc': 'Un general romano traicionado busca venganza contra el corrupto emperador que asesinó a su familia.', 
      'genres': 'Acción • Aventura • Drama'
    },
  ];

  @override
  void initState() {
    super.initState();
    _randomizeHero();
    _startTrailerTimer();
  }

  void _randomizeHero() {
    final random = DateTime.now().millisecond % _allContent.length;
    final item = _allContent[random];
    currentBg = item['bg']!;
    currentTitle = item['title']!;
    currentDescription = item['desc']!;
    currentGenres = item['genres']!;
  }

  @override
  void dispose() {
    _trailerTimer?.cancel();
    super.dispose();
  }

  void _startTrailerTimer() {
    _trailerTimer?.cancel();
    _trailerTimer = Timer(const Duration(seconds: 5), () {});
  }

  void _updateHero(Map<String, String> item) {
    if (currentBg != item['bg']) {
      setState(() {
        currentBg = item['bg']!;
        currentTitle = item['title']!;
        currentDescription = item['desc']!;
        currentGenres = item['genres']!;
      });
      _startTrailerTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(currentBg),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.4), 
                      Colors.black.withOpacity(0.1), 
                      Colors.black.withOpacity(0.95) // Gradiente más fuerte abajo para legibilidad
                    ],
                    stops: const [0.0, 0.5, 0.8]
                  )
                )
              )
            ),
            // Capa extra de sombra lateral para el texto del Hero
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    stops: const [0.0, 0.4]
                  )
                ),
              ),
            ),

            Row(
              children: [
                _buildSidebar(),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBrandHeader(),
                        const SizedBox(height: 20), 
                        Padding(padding: const EdgeInsets.only(left: 80), child: _buildHeroSection()),
                        const SizedBox(height: 40), // Restauramos el espacio normal (aire) entre secciones

                        _buildTop10Row("Top 10 en Argentina hoy", [
                          {
                            'poster': 'https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?q=60&w=800',
                            'title': 'THE WITCHER', 
                            'desc': 'Geralt de Rivia, un cazador de monstruos mutante, viaja hacia su destino en un mundo turbulento.', 
                            'genres': 'Fantasía • Acción • Drama',
                            'badge': 'Nuevos episodios'
                          },
                          {
                            'poster': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=60&w=800',
                            'title': 'LUPIN', 
                            'desc': 'Assane Diop se propone vengar a su padre por una injusticia cometida por una familia adinerada.', 
                            'genres': 'Crimen • Suspenso • Acción',
                            'badge': 'Nueva temporada'
                          },
                          {
                            'poster': 'https://images.unsplash.com/photo-1552072805-2a9039d00e57?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1552072805-2a9039d00e57?q=60&w=800',
                            'title': 'COBRA KAI', 
                            'desc': 'Treinta años después de su pelea final, Johnny Lawrence busca redención abriendo un dojo de karate.', 
                            'genres': 'Artes Marciales • Drama • Comedia',
                            'badge': 'Nueva temporada'
                          },
                          {
                            'poster': 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=60&w=800',
                            'title': 'EL JUEGO DEL CALAMAR', 
                            'desc': 'Cientos de personas con dificultades económicas aceptan una extraña invitación a juegos infantiles.', 
                            'genres': 'Thriller • Drama • Acción'
                          },
                          {
                            'poster': 'https://images.unsplash.com/photo-1485846234645-a62644f84728?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1485846234645-a62644f84728?q=60&w=800',
                            'title': 'BLACK MIRROR', 
                            'desc': 'Antología de ciencia ficción que explora un futuro próximo inquietante donde las innovaciones tecnológicas chocan con los instintos humanos.', 
                            'genres': 'Ciencia Ficción • Drama • Misterio'
                          },
                          {
                            'poster': 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?q=60&w=800',
                            'title': 'THE CROWN', 
                            'desc': 'Sigue las rivalidades políticas y el romance del reinado de la reina Isabel II.', 
                            'genres': 'Historia • Drama • Biografía'
                          },
                          {
                            'poster': 'https://images.unsplash.com/photo-1594909122845-11baa439b7bf?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1594909122845-11baa439b7bf?q=60&w=800',
                            'title': 'NARCOS', 
                            'desc': 'La verdadera historia de los poderosos y violentos carteles de droga de Colombia.', 
                            'genres': 'Crimen • Drama • Acción'
                          },
                          {
                            'poster': 'https://images.unsplash.com/photo-1616530940355-351fabd9524b?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1616530940355-351fabd9524b?q=60&w=800',
                            'title': 'DARK', 
                            'desc': 'La desaparición de dos niños en un pueblo alemán abre un misterio que abarca tres generaciones.', 
                            'genres': 'Misterio • Ciencia Ficción • Suspenso'
                          },
                          {
                            'poster': 'https://images.unsplash.com/photo-1534447677768-be436bb09401?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1534447677768-be436bb09401?q=60&w=800',
                            'title': 'MINDHUNTER', 
                            'desc': 'Dos agentes del FBI expanden las fronteras de la ciencia criminal investigando la psicología del asesinato.', 
                            'genres': 'Crimen • Drama • Thriller'
                          },
                          {
                            'poster': 'https://images.unsplash.com/photo-1478720568477-152d9b164e26?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1478720568477-152d9b164e26?q=60&w=800',
                            'title': 'EL IRLANDÉS', 
                            'desc': 'Un camionero se convierte en un asesino a sueldo involucrado con la mafia y Jimmy Hoffa.', 
                            'genres': 'Crimen • Épico • Drama'
                          },
                        ]),

                        _buildGalleryRow("Tendencias ahora", [
                          {
                            'poster': 'https://images.unsplash.com/photo-1509248961158-e54f6934749c?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1509248961158-e54f6934749c?q=60&w=800',
                            'title': 'STRANGER THINGS', 
                            'desc': 'La desaparición de un niño desata una serie de eventos sobrenaturales en Hawkins.', 
                            'genres': 'Ciencia Ficción • Misterio • Terror'
                          },
                          {
                            'poster': 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=60&w=800',
                            'title': 'SQUID GAME', 
                            'desc': 'Cientos de personas con problemas de dinero aceptan una invitación a juegos infantiles.', 
                            'genres': 'Acción • Thriller • Drama'
                          },
                          {
                            'poster': 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?q=60&w=800',
                            'title': 'THE CROWN', 
                            'desc': 'La historia del reinado de la Reina Isabel II.', 
                            'genres': 'Biografía • Historia • Drama'
                          },
                          {
                            'poster': 'https://images.unsplash.com/photo-1621609764180-2ca554a9d6f2?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1621609764180-2ca554a9d6f2?q=60&w=800',
                            'title': 'GLADIATOR', 
                            'desc': 'Un general romano traicionado busca venganza contra el corrupto emperador que asesinó a su familia.', 
                            'genres': 'Acción • Aventura • Drama'
                          },
                          {
                            'poster': 'https://images.unsplash.com/photo-1533928298208-27ff66555d8d?q=80&w=400', 
                            'bg': 'https://images.unsplash.com/photo-1533928298208-27ff66555d8d?q=60&w=800',
                            'title': 'BATMAN', 
                            'desc': 'El caballero de la noche lucha contra el crimen en Gotham City.', 
                            'genres': 'Acción • Crimen • Drama'
                          },
                        ], isOriginal: true, isNew: true),

                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebar() {
    return Focus(
      skipTraversal: true, // Evita que el tabulador o el auto-foco caigan aquí por error
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
      padding: const EdgeInsets.only(left: 80, right: 60, top: 45, bottom: 10), // Más aire arriba, menos abajo
      child: Row(
        children: [
          Text("FLOWY", style: NetflixStyles.brandLogo.copyWith(fontSize: 32)), // Antes 48 (Gigante)
          const SizedBox(width: 40),
          _navItem("Series", true),
          const SizedBox(width: 25),
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
            Container(padding: const EdgeInsets.all(3), color: NetflixStyles.redNetflix, child: const Icon(Icons.trending_up, color: Colors.white, size: 12)),
            const SizedBox(width: 6),
            const Text("N.º 1 EN ARGENTINA HOY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.0)),
          ],
        ),
        const SizedBox(height: 10),
        Text(currentTitle, style: NetflixStyles.titleMain.copyWith(fontSize: 42, letterSpacing: -1.0)), 
        const SizedBox(height: 8),
        Row(
          children: [
            const Text("98% de coincidencia", style: TextStyle(color: Color(0xFF46D369), fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(width: 15),
            const Text("2024", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(width: 15),
            _badgeMeta("16+"),
            const SizedBox(width: 15),
            _eliteBadge("4K"),
            const SizedBox(width: 5),
            _eliteBadge("HDR"),
          ],
        ),
        const SizedBox(height: 12),
        Text(currentGenres, style: NetflixStyles.genreText.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 8),
        SizedBox(
          width: 650, // Más ancho como pediste
          height: 65,  // Altura fija para 3 líneas (evita que los botones salten)
          child: Text(
            currentDescription, 
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: NetflixStyles.bodyRegular.copyWith(fontSize: 16, height: 1.3, color: Colors.white)
          )
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            _actionButton("Reproducir", Icons.play_arrow, Colors.white, Colors.black, autofocus: true),
            const SizedBox(width: 15),
            _actionButton("Más información", Icons.info_outline, Colors.white.withOpacity(0.15), Colors.white),
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

  Widget _actionButton(String label, IconData icon, Color bg, Color tc, {bool autofocus = false}) {
    return Focus(
      autofocus: autofocus,
      child: Builder(
        builder: (context) {
          final bool hasFocus = Focus.of(context).hasFocus;
          return AnimatedScale(
            scale: hasFocus ? 1.08 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding real de TV
              decoration: BoxDecoration(
                color: hasFocus ? Colors.white : bg,
                borderRadius: BorderRadius.circular(4),
                boxShadow: hasFocus ? [BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 20)] : null,
              ),
              child: Row(
                children: [
                  Icon(icon, color: hasFocus ? Colors.black : tc, size: 22), // Ícono más chico
                  const SizedBox(width: 8),
                  Text(label, style: TextStyle(color: hasFocus ? Colors.black : tc, fontSize: 16, fontWeight: FontWeight.bold)),
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
        Padding(padding: const EdgeInsets.only(left: 80), child: Text(title, style: NetflixStyles.rowTitle.copyWith(color: Colors.white, fontSize: 18))), 
        const SizedBox(height: 6), // Espacio mínimo como en Tendencias
        SizedBox(
          height: 190, // Altura reducida para que el contenido suba
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 80),
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
            width: 280, // Reducido 20px como pediste (Antes 300)
            margin: const EdgeInsets.only(right: 15), 
            child: Stack(
              clipBehavior: Clip.none, // IMPORTANTE: No recortar nada
              children: [
                Positioned(
                  left: 10, // Un poco de margen desde la izquierda
                  top: 0, 
                  child: Stack(
                    children: [
                      Text("$rank", 
                        style: TextStyle(
                          fontSize: 165,
                          fontWeight: FontWeight.w900,
                          color: Colors.white.withOpacity(0.15),
                          letterSpacing: rank >= 10 ? -15 : -8, // Más apretado si es 10 para que entre
                        )
                      ),
                      Text("$rank", 
                        style: TextStyle(
                          fontSize: 165,
                          fontWeight: FontWeight.w900,
                          letterSpacing: rank >= 10 ? -15 : -8,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1.0
                            ..color = Colors.white70,
                        )
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 60, 
                  top: 5, // Un pelín de aire arriba
                  child: AnimatedScale(
                    scale: hasFocus ? 1.1 : 1.0, 
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: 110, height: 165, 
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: hasFocus ? Border.all(color: Colors.white, width: 2.5) : null,
                        image: DecorationImage(image: NetworkImage(item['poster']!), fit: BoxFit.cover),
                        boxShadow: hasFocus ? [
                          BoxShadow(color: Colors.white.withOpacity(0.3), blurRadius: 15, spreadRadius: 2),
                          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10, offset: const Offset(4, 4))
                        ] : [
                          BoxShadow(color: Colors.black.withOpacity(0.8), blurRadius: 15, offset: const Offset(4, 4))
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 4, left: 4,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                              decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(1)),
                              child: Text("N", style: TextStyle(color: NetflixStyles.redNetflix, fontSize: 14, fontWeight: FontWeight.w900)),
                            ),
                          ),
                          if (item['badge'] != null) Positioned(
                            bottom: 0, left: 0, right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              color: NetflixStyles.redNetflix,
                              child: Text(item['badge']!.toUpperCase(), textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
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
        const SizedBox(height: 35),
        Padding(padding: const EdgeInsets.only(left: 80), child: Text(title, style: NetflixStyles.rowTitle.copyWith(color: Colors.white, fontSize: 18))),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 80),
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
                scale: hasFocus ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: 110, height: 165, 
                  margin: const EdgeInsets.only(right: 15, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: hasFocus ? Border.all(color: Colors.white, width: 2.5) : null,
                    image: DecorationImage(image: NetworkImage(item['poster']!), fit: BoxFit.cover),
                    boxShadow: hasFocus 
                      ? [
                          BoxShadow(color: Colors.white.withOpacity(0.3), blurRadius: 15, spreadRadius: 2),
                          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10, offset: const Offset(0, 5))
                        ] 
                      : [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10)],
                  ),
                  child: Stack(
                    children: [
                      if (isOriginal) Positioned(top: 0, left: 8, child: Container(padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2), decoration: NetflixStyles.ribbonStyle, child: Text("N", style: NetflixStyles.logoN.copyWith(fontSize: 12)))),
                      if (isNew) Positioned(bottom: 0, left: 0, right: 0, child: Container(padding: const EdgeInsets.symmetric(vertical: 4), color: NetflixStyles.redNetflix, child: const Center(child: Text("NUEVA TEMPORADA", style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold))))),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
