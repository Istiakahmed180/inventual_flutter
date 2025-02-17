import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventual/src/data/models/reports_model/discount_report_model.dart';

class HorizontalDiscountReportTableSection extends StatelessWidget {
  const HorizontalDiscountReportTableSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (discountReportModel.isEmpty) {
      return const Center(
        child: Text(
          'No data available',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
      );
    }

    int totalDiscount = 0;
    double totalDiscountAmount = 0;

    for (var data in discountReportModel) {
      totalDiscount += int.parse(data['discount']);
      totalDiscountAmount += double.parse(data['discountAmount']);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: DataTable(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE2E4E7), width: 0.5)),
          columnSpacing: 60,
          headingRowHeight: 50,
          dataRowHeight: 50,
          headingRowColor: MaterialStateProperty.all(const Color(0xFFEFF0F2)),
          dividerThickness: 0.0,
          border: TableBorder.all(
              color: const Color(
                0xFFE2E4E7,
              ),
              borderRadius: BorderRadius.circular(8)),
          columns: [
            DataColumn(
              label: Text(
                'Date',
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            DataColumn(
              label: Text(
                'Warehouse',
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            DataColumn(
              label: Text(
                'Name',
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            DataColumn(
              label: Text(
                'Invoice No',
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            DataColumn(
              label: Text(
                'Discount',
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            DataColumn(
              label: Text(
                'Discount Amount',
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
          rows: [
            ...discountReportModel.map(
              (data) => DataRow(
                cells: [
                  DataCell(Text(
                    data['date'],
                    style: GoogleFonts.nunito(textStyle: const TextStyle()),
                  )),
                  DataCell(Text(data['warehouse'],
                      style: GoogleFonts.nunito(textStyle: const TextStyle()))),
                  DataCell(Text(data['name'],
                      style: GoogleFonts.nunito(textStyle: const TextStyle()))),
                  DataCell(Text(data['invoiceNo'],
                      style: GoogleFonts.nunito(textStyle: const TextStyle()))),
                  DataCell(Text(data['discount'],
                      style: GoogleFonts.nunito(textStyle: const TextStyle()))),
                  DataCell(Text(data['discountAmount'],
                      style: GoogleFonts.nunito(textStyle: const TextStyle()))),
                ],
              ),
            ),
            // Total row
            DataRow(cells: [
              DataCell(Text('Total',
                  style: GoogleFonts.raleway(
                      textStyle:
                          const TextStyle(fontWeight: FontWeight.bold)))),
              const DataCell(Text('')),
              const DataCell(Text('')),
              const DataCell(Text('')),
              DataCell(Text("${totalDiscount.toString()} %",
                  style: GoogleFonts.inter(
                      textStyle:
                          const TextStyle(fontWeight: FontWeight.bold)))),
              DataCell(Text(totalDiscountAmount.toStringAsFixed(2),
                  style: GoogleFonts.inter(
                      textStyle:
                          const TextStyle(fontWeight: FontWeight.bold)))),
            ]),
          ],
        ),
      ),
    );
  }
}
