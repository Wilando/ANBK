<?php

namespace App\Exports;

use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class BarangStok implements FromCollection, WithHeadings, WithStyles
{
    use Exportable;

    public function collection()
    {
        $data = DB::table('v_barang')->select('kode', 'barang', 'jenis_barang', 'kategori_barang')->get();

        $transformedData = $data->transform(function ($item) {
            return [
                'Kolom 1' => $item->kode,
                'Kolom 2' => $item->barang,
                'Kolom 3' => $item->jenis_barang,
                'Kolom 4' => $item->kategori_barang,
                'Kolom 5' => '0', // Tambahkan kolom baru
                'Kolom 6' => '0', // Tambahkan kolom baru
            ];
        });

        return $transformedData;
    }

    public function headings(): array
    {
        // Tentukan header baris di sini
        return [
            'kode',
            'barang',
            'jenis_barang',
            'kategori_barang',
            'jumlah',
            'berat',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        // Tentukan gaya untuk header (contoh: border dan warna background)
        $sheet->getStyle('A1:'.$sheet->getHighestColumn().'1')->applyFromArray([
            'font' => [
                'bold' => true,
            ],
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                'startColor' => [
                    'argb' => 'FFFFCC', // Warna background header (contoh: abu-abu)
                ],
            ],
            'borders' => [
                'outline' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                ],
            ],
        ]);

        $sheet->getStyle('A2:'.$sheet->getHighestColumn().$sheet->getHighestRow())->applyFromArray([
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                ],
            ],
        ]);
    }
}
