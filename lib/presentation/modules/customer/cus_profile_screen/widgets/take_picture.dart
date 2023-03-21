// import 'dart:async';
// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:camerawesome/camerawesome_plugin.dart';




// class CameraPage extends StatelessWidget {
//   const CameraPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CameraAwesomeBuilder.awesome(
//         saveConfig: SaveConfig.photoAndVideo(
//           photoPathBuilder: () => _path(CaptureMode.photo),
//           videoPathBuilder: () => _path(CaptureMode.video),
//           initialCaptureMode: CaptureMode.photo,
//         ),
//         filter: AwesomeFilter.AddictiveRed,
//         flashMode: FlashMode.auto,
//         aspectRatio: CameraAspectRatios.ratio_16_9,
//         previewFit: CameraPreviewFit.fitWidth,
//         onMediaTap: (mediaCapture) {
//           OpenFile.open(mediaCapture.filePath);
//         },
//       ),
//     );
//   }

//   Future<String> _path(CaptureMode captureMode) async {
//     final Directory extDir = await getTemporaryDirectory();
//     final testDir =
//         await Directory('${extDir.path}/test').create(recursive: true);
//     final String fileExtension =
//         captureMode == CaptureMode.photo ? 'jpg' : 'mp4';
//     final String filePath =
//         '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
//     return filePath;
//   }
// }

// // class TakePictureScreen extends StatefulWidget {
// //   const TakePictureScreen({
// //     super.key,
// //     required this.camera,
// //   });

// //   final CameraDescription camera;

// //   @override
// //   TakePictureScreenState createState() => TakePictureScreenState();
// // }

// // class TakePictureScreenState extends State<TakePictureScreen> {
// //   late CameraController _controller;
// //   late Future<void> _initializeControllerFuture;

// //   @override
// //   void initState() {
// //     super.initState();

// //     _controller = CameraController(
// //       widget.camera,
// //       ResolutionPreset.medium,
// //     );

// //     _initializeControllerFuture = _controller.initialize();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
    
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Take a picture')),
// //       body: FutureBuilder<void>(
// //         future: _initializeControllerFuture,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.done) {
// //             return CameraPreview(_controller);
// //           } else {
// //             return const Center(child: CircularProgressIndicator());
// //           }
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () async {
// //           try {
// //             await _initializeControllerFuture;

// //             final image = await _controller.takePicture();

// //             if (!mounted) return;

// //             await Navigator.of(context).push(
// //               MaterialPageRoute(
// //                 builder: (context) => DisplayPictureScreen(
// //                   imagePath: image.path,
// //                 ),
// //               ),
// //             );
// //           } catch (e) {
// //             print(e);
// //           }
// //         },
// //         child: const Icon(Icons.camera_alt),
// //       ),
// //     );
// //   }
// // }

// // class DisplayPictureScreen extends StatelessWidget {
// //   final String imagePath;

// //   const DisplayPictureScreen({super.key, required this.imagePath});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Display the Picture')),
// //       body: Image.file(File(imagePath)),
// //     );
// //   }
// // }

// showBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(20),
//                               topRight: Radius.circular(20)),
//                           child: Container(
//                             decoration: const BoxDecoration(
//                               color: Color(0xff22262B),
//                               // boxShadow: [
//                               //   BoxShadow(
//                               //     color: const Color.fromARGB(255, 7, 7, 7)
//                               //         .withOpacity(0.5),
//                               //     spreadRadius: 5,
//                               //     blurRadius: 7,
//                               //     offset: const Offset(
//                               //         10, 10), // changes position of shadow
//                               //   ),
//                               // ],
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 20.0, horizontal: 20),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: const Icon(
//                                       Icons.close_rounded,
//                                       color: Colors.white,
//                                       size: 24,
//                                     ),
//                                   ),
//                                   SizedBox(height: 10.h),
//                                   Card(
//                                     child: ListTile(
//                                       leading:
//                                           const Icon(Icons.camera_alt_rounded),
//                                       title: Text(
//                                         'Capture picture',
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 18.sp,
//                                         ),
//                                       ),
//                                       onTap: () {
//                                         PickImageIntegrartion().getFromCamera();
//                                       },
//                                     ),
//                                   ),
//                                   SizedBox(height: 5.h),
//                                   Card(
//                                     child: ListTile(
//                                       leading: const Icon(Icons.image),
//                                       title: Text(
//                                         'Upload picture from Photos',
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 18.sp,
//                                         ),
//                                       ),
//                                       onTap: () {
//                                         PickImageIntegrartion()
//                                             .getFromGallery();
//                                       },
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
