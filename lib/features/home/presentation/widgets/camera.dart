import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  // Fetch available cameras inside the FutureBuilder
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>>(
      future: availableCameras(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading cameras'));
        } else if (snapshot.hasData) {
          final cameras = snapshot.data!;
          if (cameras.isEmpty) {
            return const Center(child: Text('No cameras available'));
          }

          // Initialize the camera controller with the first available camera
          _controller = CameraController(
            cameras.first, // Select the first camera
            ResolutionPreset.medium,
          );

          // Initialize the camera controller
          _initializeControllerFuture = _controller.initialize();

          // Once the camera is initialized, display the camera preview
          return FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            40), // Rounded corners for the container
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: CameraPreview(
                            _controller), // Display the camera preview
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _takePicture,
                      child: const Text('Capture Picture'),
                    ),
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return const Center(child: Text('Error initializing camera'));
              }
            },
          );
        } else {
          return const Center(child: Text('No cameras available'));
        }
      },
    );
  }

  // Method to capture a picture
  Future<void> _takePicture() async {
    try {
      // Ensure the controller is initialized before capturing the image
      await _initializeControllerFuture;
      final XFile picture = await _controller.takePicture();

      setState(() {
        // Update the image with the captured photo
        // You can display or process the image as needed
      });
    } catch (e) {
      print('Error capturing image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Error capturing image. Please try again.')),
      );
    }
  }
}
