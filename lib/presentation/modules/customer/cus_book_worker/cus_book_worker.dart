import 'dart:core';
import 'dart:developer';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:every_home/const.dart';
import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/modules/customer/cus_book_worker/widgets/custom_image_container.dart';
import 'package:every_home/presentation/modules/customer/cus_book_worker/widgets/custom_title_text.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class CusBookWorker extends StatefulWidget {
  const CusBookWorker({super.key});

  @override
  State<CusBookWorker> createState() => _CusBookWorkerState();
}

class _CusBookWorkerState extends State<CusBookWorker> {
  final formGlobalKey = GlobalKey<FormState>();
  final ValueNotifier<bool> editTextFieldNotifier = ValueNotifier(true);
  final TextEditingController issueTypeContoller = TextEditingController();
  final TextEditingController issueDescriptionContoller =
      TextEditingController();
  final TextEditingController cusAddressContoller = TextEditingController();

  final FocusNode onFocus = FocusNode();
  final AudioPlayer _audioPlayer = AudioPlayer(); // Audio playback controller
  final AudioRecorder _recorder = AudioRecorder();
  bool _isRecording = false;
  String? _filepath;
  double _currentPosition = 0;
  double _totalDuration = 0;

  @override
  void dispose() {
    _audioPlayer.dispose();
    _recorder.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    final bool isPermissionGranted = await _recorder.hasPermission();
    if (!isPermissionGranted) {
      return;
    }

    final directory = await getApplicationDocumentsDirectory();
    // Generate a unique file name using the current timestamp
    String fileName = 'recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
    _filepath = '${directory.path}/$fileName';

    // Define the configuration for the recording
    const config = RecordConfig(
      encoder: AudioEncoder.aacLc, // For example, using AAC codec
      sampleRate: 44100, // Sample rate
      bitRate: 128000, // Bit rate
    );

    // Start recording to file with the specified configuration
    await _recorder.start(config, path: _filepath!);
    setState(() {
      _isRecording = true;
    });
  }

  Future<void> _stopRecording() async {
    await _recorder.stop();
    setState(() {
      _isRecording = false;
    });
  }

  Future<void> _playRecording() async {
    if (_filepath != null) {
      // Start playing the recorded audio file
      await _audioPlayer.play(DeviceFileSource(
          _filepath!)); // Use DeviceFileSource for file playback
      // Get the total duration of the audio file
      _totalDuration = (await _audioPlayer.getDuration() ?? Duration.zero)
          .inSeconds
          .toDouble(); // Fetch duration asynchronously

      // Listen for position updates while playing
      _audioPlayer.onPositionChanged.listen((position) {
        setState(() {
          _currentPosition = position.inSeconds.toDouble();
        });
      });
    }
  }

  Future<void> _deleteRecording() async {
    if (_filepath != null) {
      try {
        final file = File(_filepath!);
        await file.delete();
        setState(() {
          _filepath = null; // Reset the filepath
          _currentPosition = 0; // Reset current position
          _totalDuration = 0; // Reset total duration
        });
      } catch (e) {
        log('Error deleting audio file: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    cusAddressContoller.text =
        'Trivandrum, Nedumangadu,\n9876897867,\nKerala 695581, \nIndia';
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: LigthColor().bgColorGrey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 1,
          title: Text(
            args.toString(),
            style: Appbartextstyle,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              Image.asset(
                'assets/bg_images/background_image_1.png',
                height: 0.7.sh,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTitleText(title: 'Issue type'),
                    CustomFormField(
                      hintText: 'eg:fan installation',
                      controller: issueTypeContoller,
                    ),
                    const CustomTitleText(title: 'Issue description'),
                    CustomFormField(
                      hintText: 'eg: Installation of new fan',
                      maxLines: 5,
                      minLines: 4,
                      controller: issueDescriptionContoller,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Min 5 words',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    const CustomTitleText(title: 'Add Audio Instruction'),
                    Container(
                      height: 60.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onLongPress: _startRecording,
                            onLongPressUp: _stopRecording,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                _isRecording ? Icons.mic_off : Icons.mic,
                                color: Colors.amber[700],
                              ),
                            ),
                          ),
                          if (_isRecording)
                            Text(
                              '          Recording...',
                              style: TextStyle(color: Colors.amber[800]),
                            )
                          else if (_filepath != null)
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: _playRecording,
                                  child: Icon(Icons.play_arrow),
                                ),
                                SizedBox(width: 5.w), // Add space between icons
                                SizedBox(
                                  width: 290.w,
                                  child: Slider(
                                    value: _currentPosition,
                                    min: 0,
                                    max:
                                        _totalDuration > 0 ? _totalDuration : 1,
                                    onChanged: (value) async {
                                      setState(() {
                                        _currentPosition = value;
                                      });
                                      // Seek to the new position
                                      await _audioPlayer.seek(
                                          Duration(seconds: value.toInt()));
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap:
                                      _deleteRecording, // Trigger the delete method
                                  child: Icon(Icons.cancel,
                                      color: Colors.amber[900]), // Delete icon
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const CustomTitleText(title: 'Edit address'),
                    ValueListenableBuilder(
                      valueListenable: editTextFieldNotifier,
                      builder: (context, value, _) {
                        return CustomFormField(
                          focusNode: onFocus,
                          controller: cusAddressContoller,
                          autofocus: false,
                          prefixIcon: const Icon(
                            Icons.home,
                            color: Color(0xffFEBA45),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              editTextFieldNotifier.value =
                                  !editTextFieldNotifier.value;
                              onFocus.requestFocus();
                            },
                            child: editTextFieldNotifier.value
                                ? Icon(Icons.edit_outlined,
                                    size: 24.r, color: Colors.grey)
                                : Icon(Icons.edit_off_outlined,
                                    size: 24.r, color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.amber),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          hintText: 'Enter your address',
                          maxLines: 5,
                          readOnly: value,
                          minLines: 4,
                        );
                      },
                    ),
                    const CustomTitleText(title: 'Add snapshots'),
                    const CustomImageContainer(),
                    SizedBox(height: 39.h),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30.w, right: 30.w, bottom: 50.h),
                      child: CustomYellowButton(
                        label: 'Pick your Date and Time',
                        onPress: () {
                          log(cusAddressContoller.text.toString());
                          Navigator.of(context)
                              .pushNamed('/date_and_time_screen');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
