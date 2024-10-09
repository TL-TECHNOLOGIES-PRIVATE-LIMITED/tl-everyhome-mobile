import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEnaJobDetailsCard extends StatefulWidget {
  const CustomEnaJobDetailsCard({
    super.key,
    this.jobType,
    this.jobDescription,
    this.price,
    this.postedTime,
    this.audioUrl,
  });

  final String? jobType;
  final String? jobDescription;
  final String? price;
  final String? postedTime;
  final String? audioUrl; // Optional URL parameter for custom audio

  @override
  _CustomEnaJobDetailsCardState createState() =>
      _CustomEnaJobDetailsCardState();
}

class _CustomEnaJobDetailsCardState extends State<CustomEnaJobDetailsCard> {
  AudioPlayer _audioPlayer = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    // Listen to audio player duration changes
    _audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    // Listen to audio player position changes
    _audioPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  // Toggle play/pause
  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      if (_position == _duration) {
        // Restart if audio has finished playing
        _audioPlayer.seek(Duration.zero);
      }
      await _audioPlayer.play(UrlSource(widget.audioUrl ??
          'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  // Format duration to mm:ss format
  String _formatDuration(Duration d) {
    String minutes = d.inMinutes.toString().padLeft(2, '0');
    String seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.jobType ?? 'Ceiling Light Repair',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Wrap(
                      children: [
                        Text(widget.postedTime ?? '8 hrs ago'),
                        const SizedBox(width: 10),
                        const Icon(Icons.favorite, color: Color(0xffFFA610)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height:
                      60.h, // Set the desired height for the scrollable area
                  child: SingleChildScrollView(
                    child: Text(
                      widget.jobDescription ??
                          'Carefully follow the instructions for the ceiling light repair.Carefully follow the instructions for the ceiling light repairCarefully follow the instructions for the ceiling light repair',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.horizontal,
                        spacing: 5.w,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Amount',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                widget.price ?? '800 per day',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.end,
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'Audio Instruction',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: _togglePlayPause,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xffFFA610),
                                  child: Icon(
                                    _isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 180.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Slider(
                                            activeColor: Color(0xffFFA610),
                                            inactiveColor:
                                                CupertinoColors.inactiveGray,
                                            thumbColor: Color(0xffFFA610),
                                            value:
                                                _position.inSeconds.toDouble(),
                                            min: 0,
                                            max: _duration.inSeconds.toDouble(),
                                            onChanged: (value) {
                                              setState(() {
                                                _audioPlayer.seek(
                                                  Duration(
                                                      seconds: value.toInt()),
                                                );
                                              });
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 3),
                                          child: Text(
                                            _formatDuration(_position),
                                            style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
