import 'dart:math';
import 'package:flutter/material.dart';

class NightSkyAnimation extends StatefulWidget {
  final double size;
  const NightSkyAnimation({super.key, this.size = 120});

  @override
  State<NightSkyAnimation> createState() => _NightSkyAnimationState();
}

class _NightSkyAnimationState extends State<NightSkyAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Twinkling stars in background
              ...List.generate(6, (index) {
                final random = Random(index + 100);
                // Position stars around the moon (avoiding exact center where moon is)
                final angle = random.nextDouble() * 2 * pi;
                final distance = widget.size * 0.25 + random.nextDouble() * (widget.size * 0.25);
                
                final x = widget.size / 2 + distance * cos(angle) - 7;
                final y = widget.size / 2 + distance * sin(angle) - 7;
                
                final scale = 0.4 + random.nextDouble() * 0.6;
                // Offset the animation phase
                final phase = (index * 0.15) * 2 * pi;
                final opacity = 0.2 + 0.8 * sin(_controller.value * 2 * pi + phase).abs();

                return Positioned(
                  left: x,
                  top: y,
                  child: Opacity(
                    opacity: opacity,
                    child: Transform.scale(
                      scale: scale,
                      child: const Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFEF08A),
                        size: 14,
                      ),
                    ),
                  ),
                );
              }),
              // Glowing crescent moon with breathing scale/glow
              Center(
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.95, end: 1.05),
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  builder: (context, scaleVal, child) {
                    final bounce = 1.0 + 0.04 * sin(_controller.value * 2 * pi);
                    return Transform.scale(
                      scale: bounce,
                      child: Container(
                        width: widget.size * 0.55,
                        height: widget.size * 0.55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFDE047).withOpacity(0.25),
                              blurRadius: 24,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: CustomPaint(
                          painter: CrescentMoonPainter(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CrescentMoonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFDE047) // Warm moon yellow
      ..style = PaintingStyle.fill;

    // Draw the main circle
    final path = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width * 0.45, size.height * 0.5),
        radius: size.width * 0.42,
      ));

    // Subtract a second overlapping circle offset to the top-right to create the crescent
    final pathSubtract = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width * 0.63, size.height * 0.4),
        radius: size.width * 0.38,
      ));

    final crescentPath = Path.combine(
      PathOperation.difference,
      path,
      pathSubtract,
    );

    canvas.drawPath(crescentPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
