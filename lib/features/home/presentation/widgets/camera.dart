import 'package:carla_locket_app/configs/api/cloudinary_config.dart';
import 'package:carla_locket_app/configs/api/server_config.dart';
import 'package:carla_locket_app/core/themes/app_colors.dart';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  final GlobalKey<CameraScreenState> key;

  const CameraScreen({required this.key}) : super(key: key);

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  CameraController? _controller; // Make controller nullable
  late Future<void> _initializeControllerFuture;
  late final Cloudinary cloudinary;
  String? _uploadedImageUrl;
  final Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    cloudinary = Cloudinary.signedConfig(
      apiKey: CloudinaryConfig.apiKey,
      apiSecret: CloudinaryConfig.apiSecret,
      cloudName: CloudinaryConfig.cloudName,
    );

    _initializeControllerFuture = initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        _controller = CameraController(
          cameras.first, // Use the first available camera
          ResolutionPreset.ultraHigh,
        );
        await _controller!.initialize(); // Safely initialize
      } else {
        throw Exception('No cameras available');
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      print('Camera is not initialized');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Camera not initialized or available')),
      );
      return;
    }

    try {
      final XFile picture = await _controller!.takePicture();

      final CloudinaryResponse response = await cloudinary.upload(
        file: picture.path,
        resourceType: CloudinaryResourceType.image,
      );

      setState(() {
        _uploadedImageUrl = response.secureUrl;
      });
      //send to server
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image uploaded! URL: ${response.secureUrl}'),
        ),
      );

      print('Uploaded Image URL: ${response.secureUrl}');
      await postImage(_uploadedImageUrl!);
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error capturing or uploading image')),
      );
    }
  }

  Future<void> postImage(String imageUrl) async {
    try {
      // Construct the server URL
      final String url =
          'http://${ServerConfig.hostName}:${ServerConfig.port}/caption/image-caption';

      // Prepare the request payload
      final Map<String, dynamic> body = {
        'image_url': imageUrl, // Send the image URL as part of the request body
      };

      // Send a POST request to the server
      final Response response = await dio.post(
        url,
        data: body, // Send the body directly
        options: Options(
          headers: {
            'Content-Type': 'application/json', // Set the request content type
          },
        ),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image sent to server successfully!')),
        );
        print('Server Response: ${response.data}');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Failed to send image: ${response.statusCode}')),
        );
        print('Error: ${response.statusCode} - ${response.data}');
      }
    } catch (e) {
      print('Error sending image to server: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error sending image to server')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done &&
            _controller != null &&
            _controller!.value.isInitialized) {
          return Container(
            margin: const EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.height / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CameraPreview(_controller!),
            ),
          );
        } else {
          return Container(
            margin: const EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'No camera available',
                style: TextStyle(color: AppColors.secondaryColor, fontSize: 15),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose(); // Dispose only if initialized
    super.dispose();
  }
}
