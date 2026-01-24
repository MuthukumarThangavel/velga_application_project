import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// Date/Time Parsing-க்கு intl பேக்கேஜ் தேவை.
import 'package:intl/intl.dart';

class ProductivityPage extends StatefulWidget {
  final String uid;
  const ProductivityPage({super.key, required this.uid});
  
  @override
  State<ProductivityPage> createState() => _ProductivityPageState();
}

class _ProductivityPageState extends State<ProductivityPage> {
  // துவக்கத்திலேயே காண்பிப்பதற்காக state variable.
  int _totalPoints = 0; 
  bool _isLoading = true; // தரவு லோட் ஆகிறதா என்பதைக் கண்காணிக்க

  @override
  void initState() {
    super.initState();
    // திரைப் பக்கம் திறக்கப்பட்டவுடன் தரவைப் பெறத் தொடங்குகிறது.
    _calculatePoints();
  }

  // டாஸ்க்கிற்கு நிர்ணயிக்கப்பட்ட கெடு தேதியையும் நேரத்தையும் இணைக்கும் function
  DateTime _getDeadlineDateTime(String dateStr, String timeStr) {
    // அட்மின் பக்கத்தில் உள்ள வடிவத்தின் அடிப்படையில் DateFormat-ஐப் பயன்படுத்துகிறோம்.
    // Date Format: 'yyyy-MM-dd' (e.g., 2025-10-30)
    // Time Format: 'h:mm a' (e.g., 7:18 PM)
    
    final deadlineDate = DateFormat('yyyy-MM-dd').parse(dateStr);
    // நேரத்தை மட்டும் parse செய்தால், அது இன்றைய தேதியை எடுத்துக்கொள்ளும்.
    final timeObject = DateFormat('h:mm a').parse(timeStr);
    
    // கெடு தேதியையும் (deadlineDate) கெடு நேரத்தையும் (timeObject) இணைக்கிறோம்.
    return DateTime(
      deadlineDate.year,
      deadlineDate.month,
      deadlineDate.day,
      timeObject.hour,
      timeObject.minute,
    );
  }


  Future<void> _calculatePoints() async {
    try {
      // 1. Loading state-ஐ true-க்கு அமைக்கவும் (தரவு வரும் வரை)
      if (mounted) {
        setState(() {
          _isLoading = true;
        });
      }
      
      final snap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .collection('assigned_tasks')
          .where('status', isEqualTo: 'done')
          .get();

      int totalAccumulatedPoints = 0;
      
      for (var d in snap.docs) {
        final data = d.data();
        
        // Base Points: அட்மின் நிர்ணயித்த அடிப்படை புள்ளி
        int calculatedPoints = (data['assignedPoints'] ?? 0) as int;
        
        // டாஸ்க் முடிக்கும் கெடு மற்றும் நிறைவு நேரம்
        final endDateStr = data['endDate'] as String?;
        final endTimeStr = data['endTime'] as String?;
        // டாஸ்க் 'done' என்று மாற்றப்பட்ட நேரம் (நாம் ஊகித்துக்கொண்ட Field)
        final completionTimestamp = data['completedOn'] as Timestamp?; 

        if (endDateStr != null && endTimeStr != null && completionTimestamp != null) {
          try {
            // 2. கெடு நேரத்தையும், நிறைவு நேரத்தையும் DateTime ஆப்ஜெக்ட்டாக மாற்றுதல்
            final deadlineDateTime = _getDeadlineDateTime(endDateStr, endTimeStr);
            final actualCompletionTime = completionTimestamp.toDate();
            
            // 3. கால வித்தியாசத்தைக் கணக்கிடுதல்
            final difference = actualCompletionTime.difference(deadlineDateTime);
            final totalMinutesDifference = difference.inMinutes;

            // 4. தாமதத்திற்கான பெனால்டியைக் கணக்கிடுதல்
            if (totalMinutesDifference > 0) {
              // Late Completion: 30 நிமிட தாமதத்திற்கு -1 புள்ளி
              final lateMinutes = totalMinutesDifference;
              final penalty = (lateMinutes / 30).floor();
              calculatedPoints -= penalty;
              debugPrint("Task: ${d.id} was LATE by $lateMinutes mins. Penalty: $penalty points. New points: $calculatedPoints");

            // 5. முன்கூட்டியே முடித்ததற்கான போனஸைக் கணக்கிடுதல்
            } else if (totalMinutesDifference < 0) {
              // Early Completion: 60 நிமிட முன்கூட்டி முடித்தலுக்கு +1 புள்ளி
              final earlyMinutes = totalMinutesDifference.abs();
              final bonus = (earlyMinutes / 60).floor();
              calculatedPoints += bonus;
              debugPrint("Task: ${d.id} was EARLY by $earlyMinutes mins. Bonus: $bonus points. New points: $calculatedPoints");
            }

          } catch (e) {
            debugPrint("Error parsing date/time for task ${d.id}: $e. Using base points only.");
            // Parsing-ல் பிழை ஏற்பட்டால், அடிப்படை புள்ளிகளை மட்டும் எடுத்துக்கொள்கிறோம்.
          }
        }
        
        totalAccumulatedPoints += calculatedPoints;
      }
      
      // 6. தரவு கிடைத்தவுடன், setState பயன்படுத்தி UI-யை புதுப்பிக்கவும்.
      if (mounted) {
        setState(() {
          _totalPoints = totalAccumulatedPoints;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Error calculating points: $e");
      // பிழை ஏற்பட்டால், 0 என்றே காண்பிக்கலாம்
      if (mounted) {
        setState(() {
          _totalPoints = 0; 
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white, // மீண்டும் வெள்ளைக்கு மாற்றியுள்ளேன்
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.shade200.withOpacity(0.5), // Shadow colour மாற்றப்பட்டுள்ளது
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 4), 
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star_rate_rounded, size: 50, color: Colors.amber),
            const SizedBox(height: 15),
            Text(
              "Total Productivity Points:",
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey.shade700,
              ),
            ),
            const SizedBox(height: 10),
            // Loading ஆகும் போது ProgressIndicator-ஐ காண்பிக்கும்.
            _isLoading
                ? const CircularProgressIndicator(color: Colors.deepPurple)
                : Text(
                    // Calculated points-ஐ காண்பிக்கிறது.
                    "$_totalPoints",
                    style: const TextStyle(
                      fontSize: 64, 
                      fontWeight: FontWeight.w900, 
                      color: Colors.deepPurple,
                    ),
                  ),
            const SizedBox(height: 10),
            Text(
              "Great work! Keep achieving your tasks.",
              style: TextStyle(
                fontSize: 14, 
                fontStyle: FontStyle.italic,
                color: Colors.blueGrey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
