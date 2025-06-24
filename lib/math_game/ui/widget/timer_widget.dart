import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final Duration duration;

  const TimerWidget({super.key, required this.duration});
  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final minutes = _twoDigits(duration.inMinutes.remainder(60));
    final seconds = _twoDigits(duration.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _TimeColumn(time: minutes, label: 'Mins'),
        _TimeColumn(time: seconds, label: 'Secs', isLast: true),
      ],
    );
  }
}

class _TimeColumn extends StatelessWidget {
  final String time;
  final String label;
  final bool isLast;
  const _TimeColumn({
    required this.time,
    required this.label,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            _Digit(digit: time[0]),
            _Digit(digit: time[1]),
            if (!isLast) const _TimeSeparator(),
          ],
        ),
      ],
    );
  }
}

class _Digit extends StatelessWidget {
  final String digit;
  const _Digit({required this.digit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 6,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRect(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          switchInCurve: Curves.easeOutExpo,
          switchOutCurve: Curves.easeInExpo,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return Stack(
              children: <Widget>[
                SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: const Offset(0, -1),
                        end: const Offset(0, 1),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOutCubic,
                        ),
                      ),
                  child: FadeTransition(opacity: animation, child: child),
                ),
                SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: const Offset(0, -1),
                        end: const Offset(0, 0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.bounceIn,
                        ),
                      ),
                  child: FadeTransition(opacity: animation, child: child),
                ),
              ],
            );
          },
          child: Text(
            digit,
            key: ValueKey<String>(digit),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 50,
            ),
          ),
        ),
      ),
    );
  }
}

class _TimeSeparator extends StatelessWidget {
  const _TimeSeparator();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Text(':', style: TextStyle(color: Colors.black, fontSize: 50)),
    );
  }
}
