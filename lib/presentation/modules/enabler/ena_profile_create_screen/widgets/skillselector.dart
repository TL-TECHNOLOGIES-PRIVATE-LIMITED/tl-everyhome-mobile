import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkillSelector extends StatefulWidget {
  @override
  _SkillSelectorState createState() => _SkillSelectorState();
}

class _SkillSelectorState extends State<SkillSelector> {
  List<String> _skills = [];
  final List<String> _allSkills = [
    'Electrician',
    'Painter',
    'Plumbing',
    'Cleaning',
    'Moving',
    'Taxi',
    'Fish',
    'Events'
  ];
  bool _showSuggestions = false; // Control when to show the dropdown list

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showSuggestions = !_showSuggestions; // Toggle the dropdown
        });
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 100, // Set the minimum height
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display selected skills (chips) at the top
              Wrap(
                spacing: 8.0,
                children: _skills.map((skill) {
                  return Chip(
                    label: Text(skill, style: TextStyle(color: Colors.black)),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    deleteIcon:
                        Icon(Icons.cancel_outlined, color: Colors.black),
                    onDeleted: () {
                      setState(() {
                        _skills.remove(skill);
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 16),

              // Display the dropdown suggestions if _showSuggestions is true
              if (_showSuggestions) ...[
                SizedBox(height: 8),
                Container(
                  height: 150, // Set a fixed height for the suggestions list
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _allSkills.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_allSkills[index]),
                        onTap: () {
                          setState(() {
                            if (!_skills.contains(_allSkills[index]) &&
                                _skills.length < 5) {
                              _skills.add(_allSkills[index]);
                            }
                            _showSuggestions =
                                false; // Close the suggestions after selection
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
              SizedBox(height: 16),

              Text(
                "Add up to 5 skills",
                style: TextStyle(color: CupertinoColors.inactiveGray),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
