import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as m;

import 'package:flutter_animate/flutter_animate.dart';

enum WonderType {
  chichenItza,
  christRedeemer,
  colosseum,
  greatWall,
  machuPicchu,
  petra,
  pyramidsGiza,
  tajMahal,
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PhotoGallery(
        collectionId: "id",
        imageSize: Size(200, 350),
        wonderType: WonderType.colosseum,
      ),
    );
  }
}

class PhotoGallery extends StatefulWidget {
  const PhotoGallery(
      {Key? key,
      this.imageSize,
      required this.collectionId,
      required this.wonderType})
      : super(key: key);
  final Size? imageSize;
  final String collectionId;
  final WonderType wonderType;

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  static const int _gridSize = 5;
  // Index starts in the middle of the grid (eg, 25 items, index will start at 13)
  int _index = ((_gridSize * _gridSize) / 2).round();
  Offset _lastSwipeDir = Offset.zero;
  final double _scale = 1;
  bool _skipNextOffsetTween = false;
  late Duration swipeDuration = Duration(milliseconds: 600) * .4;
  final _photoIds = ValueNotifier<List<String>>([
    "assets/crys_bl.png",
    "assets/crys_gr.png",
    "assets/crys_pr.png",
    "assets/crys_pr.png",
    "assets/crys_yl.png",
    "assets/crys.png",
    "assets/crys_bl.png",
    "assets/crys_gr.png",
    "assets/crys_pr.png",
    "assets/crys_pr.png",
    "assets/crys_yl.png",
    "assets/crys.png",
    "assets/crys_bl.png",
    "assets/crys_gr.png",
    "assets/crys_pr.png",
    "assets/crys_pr.png",
    "assets/crys_yl.png",
    "assets/crys.png",
    "assets/crys_bl.png",
    "assets/crys_gr.png",
    "assets/crys_pr.png",
    "assets/crys_pr.png",
    "assets/crys_yl.png",
    "assets/crys.png",
    "assets/crys_bl.png",
    "assets/crys_gr.png",
    "assets/crys_pr.png",
    "assets/crys_pr.png",
    "assets/crys_yl.png",
    "assets/crys.png",
    "assets/crys_bl.png",
    "assets/crys_gr.png",
    "assets/crys_pr.png",
    "assets/crys_pr.png",
    "assets/crys_yl.png",
    "assets/crys.png",
    "assets/crys_bl.png",
    "assets/crys_gr.png",
    "assets/crys_pr.png",
    "assets/crys_pr.png",
    "assets/crys_yl.png",
    "assets/crys.png",
    "assets/crys_bl.png",
    "assets/crys_gr.png",
    "assets/crys_pr.png",
    "assets/crys_pr.png",
    "assets/crys_yl.png",
    "assets/crys.png",
    "assets/crys_bl.png",
    "assets/crys_gr.png",
    "assets/crys_pr.png",
    "assets/crys_pr.png",
    "assets/crys_yl.png",
    "assets/crys.png",
  ]);
  int get _imgCount => m.pow(_gridSize, 2).round();

  @override
  void initState() {
    super.initState();
    _initPhotoIds();
  }

  Future<void> _initPhotoIds() async {
    setState(() => _photoIds.value = [
          "assets/crys_bl.png",
          "assets/crys_gr.png",
          "assets/crys_pr.png",
          "assets/crys_pr.png",
          "assets/crys_yl.png",
          "assets/crys.png",
          "assets/crys_bl.png",
          "assets/crys_gr.png",
          "assets/crys_pr.png",
          "assets/crys_pr.png",
          "assets/crys_yl.png",
          "assets/crys.png",
          "assets/crys_bl.png",
          "assets/crys_gr.png",
          "assets/crys_pr.png",
          "assets/crys_pr.png",
          "assets/crys_yl.png",
          "assets/crys.png",
          "assets/crys_bl.png",
          "assets/crys_gr.png",
          "assets/crys_pr.png",
          "assets/crys_pr.png",
          "assets/crys_yl.png",
          "assets/crys.png",
          "assets/crys_bl.png",
          "assets/crys_gr.png",
          "assets/crys_pr.png",
          "assets/crys_pr.png",
          "assets/crys_yl.png",
          "assets/crys.png",
          "assets/crys_bl.png",
          "assets/crys_gr.png",
          "assets/crys_pr.png",
          "assets/crys_pr.png",
          "assets/crys_yl.png",
          "assets/crys.png",
          "assets/crys_bl.png",
          "assets/crys_gr.png",
          "assets/crys_pr.png",
          "assets/crys_pr.png",
          "assets/crys_yl.png",
          "assets/crys.png",
          "assets/crys_bl.png",
          "assets/crys_gr.png",
          "assets/crys_pr.png",
          "assets/crys_pr.png",
          "assets/crys_yl.png",
          "assets/crys.png",
          "assets/crys_bl.png",
          "assets/crys_gr.png",
          "assets/crys_pr.png",
          "assets/crys_pr.png",
          "assets/crys_yl.png",
          "assets/crys.png",
        ]);
  }

  void _setIndex(int value, {bool skipAnimation = false}) {
    if (value < 0 || value >= _imgCount) return;
    _skipNextOffsetTween = skipAnimation;
    setState(() => _index = value);
  }

  /// Determine the required offset to show the current selected index.
  /// index=0 is top-left, and the index=max is bottom-right.
  Offset _calculateCurrentOffset(double padding, Size size) {
    double halfCount = (_gridSize / 2).floorToDouble();
    Size paddedImageSize = Size(size.width + padding, size.height + padding);
    // Get the starting offset that would show the top-left image (index 0)
    final originOffset = Offset(
        halfCount * paddedImageSize.width, halfCount * paddedImageSize.height);
    // Add the offset for the row/col
    int col = _index % _gridSize;
    int row = (_index / _gridSize).floor();
    final indexedOffset =
        Offset(-paddedImageSize.width * col, -paddedImageSize.height * row);
    return originOffset + indexedOffset;
  }

  /// Used for hiding collectibles around the photo grid.

  /// Converts a swipe direction into a new index
  void _handleSwipe(Offset dir) {
    // Calculate new index, y swipes move by an entire row, x swipes move one index at a time
    int newIndex = _index;
    if (dir.dy != 0) newIndex += _gridSize * (dir.dy > 0 ? -1 : 1);
    if (dir.dx != 0) newIndex += (dir.dx > 0 ? -1 : 1);
    // After calculating new index, exit early if we don't like it...
    if (newIndex < 0 || newIndex > _imgCount - 1)
      return; // keep the index in range
    if (dir.dx < 0 && newIndex % _gridSize == 0)
      return; // prevent right-swipe when at right side
    if (dir.dx > 0 && newIndex % _gridSize == _gridSize - 1)
      return; // prevent left-swipe when at left side
    _lastSwipeDir = dir;
    //  AppHaptics.lightImpact();
    _setIndex(newIndex);
  }

  // Future<void> _handleImageTapped(int index) async {
  //   if (_index == index) {
  //     final urls = _photoIds.value.map((e) {
  //       return UnsplashPhotoData.getSelfHostedUrl(e, UnsplashPhotoSize.xl);
  //     }).toList();
  //     int? newIndex = await appLogic.showFullscreenDialogRoute(
  //       context,
  //       FullscreenUrlImgViewer(urls: urls, index: _index),
  //     );

  //     if (newIndex != null) {
  //       _setIndex(newIndex, skipAnimation: true);
  //     }
  //   } else {
  //     _setIndex(index);
  //   }
  // }

  // bool _checkCollectibleIndex(int index) {
  //   return index == _getCollectibleIndex() &&
  //       collectiblesLogic.isLost(widget.wonderType, 1);
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    Size imgSize = Size(size.width * .5, size.height * .66);

    imgSize = (widget.imageSize ?? imgSize) * _scale;
    // Get transform offset for the current _index
    final padding = 10.0;
    var gridOffset = _calculateCurrentOffset(padding, imgSize);
    gridOffset += Offset(0, -20 / 2);
    final offsetTweenDuration =
        _skipNextOffsetTween ? Duration.zero : swipeDuration;
    final cutoutTweenDuration =
        _skipNextOffsetTween ? Duration.zero : swipeDuration * .5;
    return _AnimatedCutoutOverlay(
      animationKey: ValueKey(_index),
      cutoutSize: imgSize,
      swipeDir: _lastSwipeDir,
      duration: cutoutTweenDuration,
      opacity: _scale == 1 ? .7 : .5,
      child: SafeArea(
        bottom: false,
        // Place content in overflow box, to allow it to flow outside the parent
        child: OverflowBox(
          maxWidth: _gridSize * imgSize.width + padding * (_gridSize - 1),
          maxHeight: _gridSize * imgSize.height + padding * (_gridSize - 1),
          alignment: Alignment.center,
          // Detect swipes in order to change index
          child: EightWaySwipeDetector(
            onSwipe: _handleSwipe,
            threshold: 30,
            // A tween animation builder moves from image to image based on current offset
            child: TweenAnimationBuilder<Offset>(
              tween: Tween(begin: gridOffset, end: gridOffset),
              duration: offsetTweenDuration,
              curve: Curves.easeOut,
              builder: (_, value, child) =>
                  Transform.translate(offset: value, child: child),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: _gridSize,
                childAspectRatio: imgSize.aspectRatio,
                mainAxisSpacing: padding,
                crossAxisSpacing: padding,
                children: List.generate(
                    _imgCount,
                    (i) => Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(_photoIds.value[i]),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                        )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        height: size.height,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.5,
              crossAxisCount: size.width > 1000
                  ? 8
                  : size.width > 650
                      ? 6
                      : size.width > 500
                          ? 4
                          : size.width > 300
                              ? 3
                              : 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          itemCount: 60,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                      spreadRadius: 2,
                      blurRadius: 5),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                      flex: 6,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          "https://tastesbetterfromscratch.com/wp-content/uploads/2023/06/Pepperoni-Pizza-1.jpg",
                          fit: BoxFit.cover,
                        ),
                      )),
                  const Expanded(
                    flex: 1,
                    child: Text("Pizza"),
                  )
                ],
              ),
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// An overlay with a animated cutout in the middle.
/// When animationKey changes, the box animates its size, shrinking then returning to its original size.
/// Uses[_CutoutClipper] to create the cutout.
class _AnimatedCutoutOverlay extends StatelessWidget {
  const _AnimatedCutoutOverlay(
      {Key? key,
      required this.child,
      required this.cutoutSize,
      required this.animationKey,
      this.duration,
      required this.swipeDir,
      required this.opacity})
      : super(key: key);
  final Widget child;
  final Size cutoutSize;
  final Key animationKey;
  final Offset swipeDir;
  final Duration? duration;
  final double opacity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Animate(
          effects: [
            CustomEffect(
                builder: _buildAnimatedCutout,
                curve: Curves.easeOut,
                duration: duration)
          ],
          key: animationKey,
          onComplete: (c) => c.reverse(),
          child: IgnorePointer(
              child: Container(color: Colors.black.withOpacity(opacity))),
        ),
      ],
    );
  }

  /// Scales from 1 --> (1 - scaleAmt) --> 1
  Widget _buildAnimatedCutout(BuildContext context, double anim, Widget child) {
    // controls how much the center cutout will shrink when changing images
    const scaleAmt = .25;
    final size = Size(
      cutoutSize.width * (1 - scaleAmt * anim * swipeDir.dx.abs()),
      cutoutSize.height * (1 - scaleAmt * anim * swipeDir.dy.abs()),
    );
    return ClipPath(clipper: _CutoutClipper(size), child: child);
  }
}

/// Creates an overlay with a hole in the middle of a certain size.
class _CutoutClipper extends CustomClipper<Path> {
  _CutoutClipper(this.cutoutSize);
  final Size cutoutSize;

  @override
  Path getClip(Size size) {
    double padX = (size.width - cutoutSize.width) / 2;
    double padY = (size.height - cutoutSize.height) / 2;

    return Path.combine(
      PathOperation.difference,
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
      Path()
        ..addRRect(
          RRect.fromLTRBR(
            padX,
            padY,
            size.width - padX,
            size.height - padY,
            Radius.circular(6),
          ),
        )
        ..close(),
    );
  }

  @override
  bool shouldReclip(_CutoutClipper oldClipper) =>
      oldClipper.cutoutSize != cutoutSize;
}

class EightWaySwipeDetector extends StatefulWidget {
  const EightWaySwipeDetector(
      {Key? key,
      required this.child,
      this.threshold = 50,
      required this.onSwipe})
      : super(key: key);
  final Widget child;
  final double threshold;
  final void Function(Offset dir)? onSwipe;

  @override
  State<EightWaySwipeDetector> createState() => _EightWaySwipeDetectorState();
}

class _EightWaySwipeDetectorState extends State<EightWaySwipeDetector> {
  Offset _startPos = Offset.zero;
  Offset _endPos = Offset.zero;
  bool _isSwiping = false;

  void _resetSwipe() {
    _startPos = _endPos = Offset.zero;
    _isSwiping = false;
  }

  void _maybeTriggerSwipe() {
    // Exit early if we're not currently swiping
    if (_isSwiping == false) return;
    // Get the distance of the swipe
    Offset moveDelta = _endPos - _startPos;
    final distance = moveDelta.distance;
    // Trigger swipe if threshold has been exceeded, if threshold is < 1, use 1 as a minimum value.
    if (distance >= m.max(widget.threshold, 1)) {
      // Normalize the dx/dy values between -1 and 1
      moveDelta /= distance;
      // Round the dx/dy values to snap them to -1, 0 or 1, creating an 8-way directional vector.
      Offset dir = Offset(
        moveDelta.dx.roundToDouble(),
        moveDelta.dy.roundToDouble(),
      );
      widget.onSwipe?.call(dir);
      _resetSwipe();
    }
  }

  void _handleSwipeStart(d) {
    _isSwiping = true;
    _startPos = _endPos = d.localPosition;
  }

  void _handleSwipeUpdate(d) {
    _endPos = d.localPosition;
    _maybeTriggerSwipe();
  }

  void _handleSwipeEnd(d) {
    _maybeTriggerSwipe();
    _resetSwipe();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onPanStart: _handleSwipeStart,
        onPanUpdate: _handleSwipeUpdate,
        onPanCancel: _resetSwipe,
        onPanEnd: _handleSwipeEnd,
        child: widget.child);
  }
}
