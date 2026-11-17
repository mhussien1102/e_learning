import 'package:e_learning/core/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RevenueStatsWidget extends StatelessWidget {
  const RevenueStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Revenue Statistics',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRevenueMetric('Monthly Revenue', '2,345\$'),
              _buildRevenueMetric('Annual Revenue', '28,345\$'),
            ],
          ),
          SizedBox(height: 24),
          Text(
            'Revenue by Course',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 5000,
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [BarChartRodData(toY: 3000)],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [BarChartRodData(toY: 2000)],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [BarChartRodData(toY: 4000)],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [BarChartRodData(toY: 1500)],
                  ),
                ],
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const titles = [
                          'Course 1',
                          'Course 2',
                          'Course 3',
                          'Course 4',
                        ];
                        return Text(
                          titles[value.toInt()],
                          style: TextStyle(fontSize: 12),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueMetric(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
