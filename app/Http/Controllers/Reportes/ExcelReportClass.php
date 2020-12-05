<?php 

namespace App\Http\Controllers\Reportes; 

use Maatwebsite\Excel\Concerns\FromCollection; 
use Maatwebsite\Excel\Concerns\WithHeadings; 
use \Illuminate\Support\Collection; 
use Maatwebsite\Excel\Concerns\ShouldAutoSize; 
use Maatwebsite\Excel\Concerns\WithEvents; 
use Maatwebsite\Excel\Events\AfterSheet; 
use Maatwebsite\Excel\Concerns\WithCustomStartCell;
use Maatwebsite\Excel\Concerns\WithDrawings;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

use App\Models\Colegio;

class ExcelReportClass implements FromCollection, WithHeadings, ShouldAutoSize, WithEvents, WithCustomStartCell, WithDrawings, WithStyles 
{ 
    private $collection; 
    private $headers; 
    private $logo;
    private $institute;
    private $title;
    private $colegio;
     
    public function __construct($dataArray, $headers, $logo="/images/logo-colegio.jpg", $title = 'Reporte', $institute = 'UNIDAD EDUCATIVA FUENTE DE JACOB') 
    { 
        
        $DIR = DIRECTORY_SEPARATOR;
        
        $colegio =  Colegio::with(['foto:id,tx_src,id_origen'])->find(1);

        $logo = public_path($logo);

      /*   if($colegio->foto)
        {
            $logo = storage_path('app'. $DIR .'public'. $DIR . 'colegio'. $DIR .  'foto' . $DIR . $colegio->id . $DIR .  $colegio->foto->tx_src);
        } */

        $this->collection = collect($dataArray); 
        $this->headers    = $headers;
        $this->logo       = $logo; 
        $this->institute  = $colegio->nb_colegio;
        $this->title      = $title;
    } 

    public function startCell(): string
    {
        return 'A6';
    }

    public function drawings()
    {
        $drawing = new Drawing();
        $drawing->setName('Logo');
        $drawing->setDescription('Logo del Colegio');
        $drawing->setPath($this->logo);
        $drawing->setHeight(90);
        $drawing->setCoordinates('A1');

        return $drawing;
    }

    public function styles(Worksheet $sheet)
    {
        return [
            4  =>   [
                    'font' =>   [
                                    'size' => 14
                                ],
                    'fill' =>   [
                                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                                    'startColor' => [
                                        'argb' => 'F0EEEEEE',
                                    ],
                                ]
                    ],

            6  =>   ['font' => ['size' => 14]],
        ];
    }

    public function collection() 
    { 
        return  $this->collection; 
    } 

    public function headings() :array 
    { 
        return $this->headers; 
    } 

    public function registerEvents(): array 
    { 
        return [ 
            AfterSheet::class    => function(AfterSheet $event) 
            { 
                $event->sheet->getDelegate()->getRowDimension('1')->setRowHeight(75);
                $event->sheet->getDelegate()->getRowDimension('5')->setRowHeight(3);
                $event->sheet->getDelegate()->mergeCells('A2:B2');
                $event->sheet->getDelegate()->mergeCells('A4:B4');
 
                $event->sheet->getDelegate()->setCellValue('A2', $this->institute);
                $event->sheet->getDelegate()->setCellValue('A4', $this->title);

                $event->sheet->getDelegate()->getStyle('4')->getFill()
                ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                ->getStartColor()->setARGB('F0EEEEEE');

                $event->sheet->getDelegate()->getStyle('5')->getFill()
                ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                ->getStartColor()->setARGB('C0C0C0C0');
            }, 
        ]; 
    } 
}

/*
    $event->sheet->getDelegate()->setCellValue('D1', 39813); 
    $event->sheet->getStyle('D1') 
    ->getNumberFormat() 
    ->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_DATE_DDMMYYYY); 
    ->getStyle('A1')->getNumberFormat() 
    ->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_NUMBER_COMMA_SEPARATED1);
*/ 