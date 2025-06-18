import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:website_portofolio/core/palette.dart';
import 'package:website_portofolio/core/responsive.dart';
import 'package:website_portofolio/data/timeline_data.dart';
import 'package:website_portofolio/widgets/animated_entrance.dart';

class EducationExperienceSection extends StatelessWidget {
  const EducationExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      decoration: const BoxDecoration(gradient: Palette.evenSection),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 48 : 96,
          horizontal: isMobile ? 24 : 120,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTimelineSection(context, 'Education', education),
              const SizedBox(height: 48),
              _buildTimelineSection(context, 'Experience', experience),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineSection(
    BuildContext context,
    String header,
    List<TimelineData> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 40),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(items.length, (index) {
                final data = items[index];
                return FadeInLeft(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 160,
                      maxWidth: 280,
                    ),
                    child: SizedBox(
                      height: 140,
                      child: TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.manual,
                        lineXY: 0.2,
                        isFirst: index == 0,
                        isLast: index == items.length - 1,
                        indicatorStyle: IndicatorStyle(
                          width: 25,
                          height: 25,
                          indicator: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.lightBlueAccent,
                                  Colors.blueAccent.shade200,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                        beforeLineStyle: LineStyle(
                          color: Colors.black54,
                          thickness: 3,
                        ),
                        afterLineStyle: LineStyle(
                          color: Colors.black54,
                          thickness: 3,
                        ),
                        startChild: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            data.period,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        endChild: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            height: 180,
                            child: Column(
                              children: [
                                Card(
                                  color: const Color(0xFFF8F6FA),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          data.title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          maxLines: 3,
                                          overflow: TextOverflow.visible,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          data.subtitle,
                                          style: const TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          maxLines: 3,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
