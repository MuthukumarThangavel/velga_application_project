import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velga_application/Screens/adminpage.dart';
import 'package:velga_application/Screens/login_page.dart';
import 'package:velga_application/Screens/profileupdatepage.dart';
import 'package:velga_application/Screens/susbmitpage.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

class Profilepage extends StatelessWidget {
   final String uid; // ✅ accept uid from Navigationpage

  const Profilepage({super.key, required this.uid});

  // 1. New function to clear data and navigate
  Future<void> _performSignOut() async {
    try {
      // Clear Local Data (Assuming you save login status or user ID here)
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      
      // 'user_token' அல்லது 'isLoggedIn' போன்ற key-களை நீங்கள் Clear செய்ய வேண்டும்.
      // இது உங்களின் பயன்பாட்டைப் பொறுத்து மாறும். 
      // கீழே உள்ள கோடு அனைத்து தரவுகளையும் நீக்குகிறது, இது பாதுகாப்பானது:
      await prefs.clear(); 
      
      // 2. Navigate to Login Page and remove all previous screens
      // Get.offAll() பயன்படுத்தினால், இனி "Back" பட்டனை அழுத்த முடியாது.
      Get.offAll(() => LoginPage()); 

      Get.snackbar(
        'Success', 
        'Signed out successfully. Your session has been cleared.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

    } catch (e) {
      Get.snackbar(
        'Error', 
        'Error during sign out: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // 2. _showSignOutDialog function-ஐ _performSignOut-க்கு அழைப்பு விடுக்கும்படி மாற்றுதல்
  void _showSignOutDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out and clear your session?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back(); // Dialog-ஐ மூடுதல்
              _performSignOut(); // Sign Out செயல்முறையைத் தொடங்குதல்
            },
            child: const Text('Sign Out'),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Get.to(() => Updatepage());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Header
            _buildProfileHeader(),
            const SizedBox(height: 20),
            
            // User Information
            _buildUserInformation(),
            const SizedBox(height: 20),
            
            // Statistics
            _buildStatistics(),
            const SizedBox(height: 20),
            
            // Quick Actions
            _buildQuickActions(),
          ],
        ),
      ),
    );
  }

  // All other _build... widget methods remain the same as provided.
  // Note: Added 'const' to fixed widgets for performance improvement.

  Widget _buildProfileHeader() {
      return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Colors.blue.shade400, Colors.blue.shade600],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              // Profile Avatar
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.blue.shade600,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Name
              const Text(
                'User Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 4),
              
              // Employee ID
              const Text(
                'ID:',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Department
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Department',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    
  }

  Widget _buildUserInformation() {
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 16),
              
              _buildInfoRow('Full Name','John Doe', Icons.person),
              const Divider(),
              _buildInfoRow('Email', 'john.doe@company.com', Icons.email),
              const Divider(),
              _buildInfoRow('Employee ID', 'EMP001', Icons.badge),
              const Divider(),
              _buildInfoRow('Department', 'Engineering', Icons.business),
              const Divider(),
              _buildInfoRow('Join Date', '23/07/2025', Icons.calendar_today),
            ],
          ),
        ),
      );
    
  }

  Widget _buildStatistics() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Attendance Statistics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 16),
            
            
              
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard('Total Days','hi', Icons.calendar_today, Colors.blue),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard('Present', 'hii', Icons.check_circle, Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard('Total Hours', 'h', Icons.access_time, Colors.orange),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard('Avg Hours', 'h', Icons.trending_up, Colors.purple),
                      ),
                    ],
                  ),
                ],
              ),
            
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 16),
            
            // Action buttons
            _buildActionButton(
              'View Full History',
              'See all attendance records',
              Icons.history,
              Colors.blue,
              () {
                Get.snackbar('Info', 'Full history view would be implemented here');
              },
            ),
            
            const SizedBox(height: 12),
            
            _buildActionButton(
              'Download Report',
              'Export attendance data',
              Icons.download,
              Colors.green,
              () {
                Get.snackbar('Info', 'Report download would be implemented here');
              },
            ),
            
            const SizedBox(height: 12),
            
            _buildActionButton(
              'Contact Support',
              'Get help and support',
              Icons.support_agent,
              Colors.orange,
              () {
                Get.snackbar('Info', 'Support contact would be implemented here');
              },
            ),
            
            const SizedBox(height: 12),


            _buildActionButton(
              'Admin',
              'Access for only admin',
              Icons.add_moderator_outlined,
              Colors.cyan,
              () {
                Get.to(() => AdminPage());
                
              },
            ),
            const SizedBox(height: 20),
            _buildActionButton(
              'Account',
              'Create your Account',
              Icons.person,
              Colors.purpleAccent,
              () {
                Get.to(() => Submitpage());
                
              },
            ),
            const SizedBox(height: 20),
            
            // Sign Out button now calls the dialog which leads to data clearing
            _buildActionButton(
              'Sign Out',
              'Log out from the application',
              Icons.logout,
              Colors.red,
              () {
                _showSignOutDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String title, String subtitle, IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: color.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return '${date.day}/${date.month}/${date.year}';
  }
}