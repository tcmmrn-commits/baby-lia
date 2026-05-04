import 'package:flutter/material.dart';

import '../../app/router.dart';
import '../../shared/widgets/lia_avatar.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  static const _pages = <_OnboardingPageData>[
    _OnboardingPageData(
      title: 'Meet Baby Lia',
      description:
          'A safe AI learning buddy for kids with colors, numbers, simple words, and guided conversations.',
      pills: ['Safe', 'Playful', 'Educational'],
    ),
    _OnboardingPageData(
      title: 'Learn in Small Happy Steps',
      description:
          'Explore colors, numbers, shapes, animals, body parts, and first words through calm, guided play.',
      pills: ['Short Lessons', 'Gentle Voice', 'Clear Choices'],
    ),
    _OnboardingPageData(
      title: 'Parents Stay in Control',
      description:
          'Track progress, adjust settings, and keep every learning session simple, warm, and age-friendly.',
      pills: ['Progress', 'Settings', 'Protected Parent Area'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goNext() {
    if (_currentPage == _pages.length - 1) {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_currentPage];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF6EE), Color(0xFFFFE6EF), Color(0xFFEAF7FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final item = _pages[index];
                      return _OnboardingPage(item: item);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 26 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? const Color(0xFF7C4A3A)
                            : const Color(0xFFD8C5BA),
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            page.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _goNext,
                            child: Text(
                              _currentPage == _pages.length - 1
                                  ? 'Start Learning'
                                  : 'Next',
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(
                              context, AppRoutes.parentGate),
                          child: const Text('Parent Area'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final _OnboardingPageData item;

  const _OnboardingPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 228,
              height: 228,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.45),
                shape: BoxShape.circle,
              ),
            ),
            const LiaAvatar(size: 160),
          ],
        ),
        const SizedBox(height: 28),
        Text(
          item.title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: -0.4,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          item.description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.45,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: item.pills.map((pill) => _HeroPill(label: pill)).toList(),
        ),
      ],
    );
  }
}

class _HeroPill extends StatelessWidget {
  final String label;

  const _HeroPill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFF2DACC)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _OnboardingPageData {
  final String title;
  final String description;
  final List<String> pills;

  const _OnboardingPageData({
    required this.title,
    required this.description,
    required this.pills,
  });
}
