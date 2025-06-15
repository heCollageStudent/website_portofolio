// Data model
class TimelineData {
  final String period, title, subtitle;
  TimelineData({
    required this.period,
    required this.title,
    required this.subtitle,
  });
}

// Sample Data
final education = [
  TimelineData(
    period: '2018–2021',
    title: 'Public Senior High School 18 Bekasi',
    subtitle: 'Science Major',
  ),
  TimelineData(
    period: '2021–Present',
    title: 'Gunadarma University',
    subtitle: 'Informatics',
  ),
];

final experience = [
  TimelineData(
    period: 'Sept 2022 - Present',
    title: 'Laboratory Assistant',
    subtitle: 'Lembaga Pengembangan Komputerisasi Gunadarma',
  ),
  TimelineData(
    period: 'Mar 2023 – Present',
    title: 'Course Instructor',
    subtitle: 'Lembaga Pengembangan Komputerisasi Gunadarma',
  ),
  TimelineData(
    period: 'Feb – Jul 2024',
    title: 'Mobile Development Cohort',
    subtitle: 'Bangkit Academy Ied by Google, Tokopedia, Gojek & Traveloka',
  ),
  TimelineData(
    period: 'Sep 2024 – Jan 2025',
    title: 'Mobile Development Intern',
    subtitle: 'Lembaga Layanan Pendidikan Tinggi Wilayah III',
  ),
];
