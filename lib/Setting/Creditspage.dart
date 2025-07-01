import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Creditspage extends StatefulWidget {
  const Creditspage({super.key});

  @override
  _CreditsPageState createState() => _CreditsPageState();
}

class _CreditsPageState extends State<Creditspage> {
  void _copyToClipboard(String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label copied to clipboard!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, {bool copyable = false}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
                if (copyable)
                  IconButton(
                    icon: const Icon(Icons.copy, color: Colors.indigo),
                    onPressed: () => _copyToClipboard(value, title),
                    tooltip: 'Copy $title',
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Credits & Info"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Travel BD",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Discover Beautiful Bangladesh",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 30),

              // Firebase Project Information
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "🔥 Firebase Project Details",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoCard("Project Name", "Travel BD"),
                    _buildInfoCard("Project ID", "travel-bd-4c50d",
                        copyable: true),
                    _buildInfoCard("Project Number", "708008442857",
                        copyable: true),
                    _buildInfoCard("Web API Key",
                        "AIzaSyBzVT26tIufhHz5K6PH6vjZHN4zhuKwzFA",
                        copyable: true),
                    _buildInfoCard("Support Email", "a.n.swapnil2003@gmail.com",
                        copyable: true),
                    _buildInfoCard("Public Name", "project-708008442857"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // App Information
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "📱 Application Details",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoCard("Android App ID",
                        "1:708008442857:android:9edd91ff70b2bfe9ae6978",
                        copyable: true),
                    _buildInfoCard("Android Package", "com.example.travel_bd",
                        copyable: true),
                    _buildInfoCard("iOS Bundle ID", "com.example.travelBd",
                        copyable: true),
                    _buildInfoCard("Web App", "demo_project (web)",
                        copyable: true),
                    _buildInfoCard("Windows App", "demo_project (windows)",
                        copyable: true),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Developer Credits
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "👨‍💻 Development Credits",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoCard("Lead Developer", "Ahmmad Nur Swapnil"),
                    _buildInfoCard("Framework", "Flutter"),
                    _buildInfoCard("Backend", "Firebase"),
                    _buildInfoCard("Database", "Cloud Firestore"),
                    _buildInfoCard("Authentication", "Firebase Auth"),
                    _buildInfoCard("Storage", "Firebase Storage"),
                    _buildInfoCard("State Management", "GetX & Provider"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Special Thanks
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "🙏 Special Thanks",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "• Flutter Community\n"
                      "• Firebase Team\n"
                      "• Google Maps Platform\n"
                      "• Open Source Contributors\n"
                      "• Bangladesh Tourism Board\n"
                      "• All Beta Testers",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Version Info
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "ℹ️ Version Information",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoCard("App Version", "1.0.0+1"),
                    _buildInfoCard("Build Date", "July 2025"),
                    _buildInfoCard("Environment", "Production"),
                    _buildInfoCard("Min SDK", "Android 21+ / iOS 11+"),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
