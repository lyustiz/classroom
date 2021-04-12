<?php

namespace App\Http\Controllers\Reportes\PDF;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use PDF;
use App\Models\CertificadoAlumno;

class PDFCertificado extends Controller
{
    public function generate($idCertificadoAlumno)
    {
        $certificado =  CertificadoAlumno::with([
                            'alumno',
                            'certificado',
                            'certificado.planEvaluacion.periodo'
                        ])
                        ->find($idCertificadoAlumno);
        
        
        $folder = 'public' . DIRECTORY_SEPARATOR .  'foto' . DIRECTORY_SEPARATOR .  'certificado' . DIRECTORY_SEPARATOR ;
        
        $txPath = Storage::path($folder.$certificado->certificado->tx_path);
       
        PDF::setHeaderCallback(function($pdf) use ($certificado) {        
            $bMargin = $pdf->getBreakMargin();
            $pdf->SetAutoPageBreak(false, 0);
            $pdf->Image(public_path($certificado->certificado->tx_path), null, null, 329, 210, '', '', 'M', false, 400, 'C', false, false, 0, false, false, false);
            $pdf->SetAutoPageBreak(true, $bMargin);
        });

        PDF::AddPage('L'); 
        PDF::SetFont('dejavusans', null, 18);
        PDF::Image(public_path('logo.png'), 0, 5, 20, 20, '', '', 'M', false, 400, 'L', false, false, 0, false, false, false);
        PDF::SetXY(35, 4);
        PDF::Cell(80, 25, 'Instituto Prueba', 0 ,0, 'L'); 
        
        PDF::SetXY(0, 40);
        PDF::Cell(0, 16, $certificado->certificado->tx_linea1, 0, 1, 'C', 0, 1);
        PDF::SetFont('yellowtail', null, 70);
        PDF::Cell(0, 25, $certificado->alumno->nb_alumno, 0, 1, 'C', 0, 1);
        
        PDF::SetY(98);
        PDF::SetFont('dejavusans', null, 18);
        PDF::Cell(0, 8, $certificado->certificado->tx_linea2, 0 , 1, 'C', 0, 1);
        PDF::SetFont('helvetica', 'B', 34);
        PDF::Cell(0, 25, 'Turismo Bilingüe', 0, 1, 'C', 0, 1);
        PDF::SetFont('helvetica', 'B', 18);
        
        PDF::SetY(140);
        PDF::Cell(0, 8, 'Aprobado el '. $certificado->fe_aprobacion, 0, 1, 'C', 0, 1);
        PDF::SetFont('dejavusans', null, 16);
        PDF::Cell(0, 8, $certificado->certificado->tx_linea3, 0, 1, 'C', 0, 1);
        PDF::SetFont('dejavusans', 'B', 14);
        PDF::Cell(0, 8, 'Código: ' . $certificado->tx_codigo, 0, 1, 'C', 0, 1);

        PDF::Output();
    }

    public function generate2()
    {
       
        $folder = 'public' . DIRECTORY_SEPARATOR .  'foto' . DIRECTORY_SEPARATOR .  'certificado' . DIRECTORY_SEPARATOR ;
        
        $txPath = Storage::path($folder.'base.jpg');
       
        PDF::setHeaderCallback(function($pdf){        
            $bMargin = $pdf->getBreakMargin();
            $pdf->SetAutoPageBreak(false, 0);
            $pdf->Image(public_path('base2.jpg'), null, null, 329, 210, '', '', 'M', false, 400, 'C', false, false, 0, false, false, false);
            $pdf->SetAutoPageBreak(true, $bMargin);
        });

        PDF::AddPage('L'); 
        PDF::SetFont('dejavusans', null, 18);
        PDF::Image(public_path('logo.png'), 0, 5, 20, 20, '', '', 'M', false, 400, 'L', false, false, 0, false, false, false);
        PDF::SetXY(35, 4);
        PDF::Cell(80, 25, 'Instituto Prueba', 0 ,0, 'L'); 
        
        PDF::SetXY(0, 40);
        PDF::Cell(0, 16, 'Certifica que:', 0, 1, 'C', 0, 1);
        PDF::SetFont('yellowtail', null, 70);
        PDF::Cell(0, 25, 'Jose Azuaje Gonzalez', 0, 1, 'C', 0, 1);
        
        PDF::SetY(98);
        PDF::SetFont('dejavusans', null, 18);
        PDF::Cell(0, 8, 'Aprobó el curso de:', 0 , 1, 'C', 0, 1);
        PDF::SetFont('helvetica', 'B', 34);
        PDF::Cell(0, 25, 'Turismo Bilingüe', 0, 1, 'C', 0, 1);
        PDF::SetFont('helvetica', 'B', 18);
        
        PDF::SetY(140);
        PDF::Cell(0, 8, 'Aprobado el 22 de Octubre de 2020', 0, 1, 'C', 0, 1);
        PDF::SetFont('dejavusans', null, 16);
        PDF::Cell(0, 8, '19 horas Teoría y Practica', 0, 1, 'C', 0, 1);
        PDF::SetFont('dejavusans', 'B', 14);
        PDF::Cell(0, 8, 'Código: 00-21-00-9-20121', 0, 1, 'C', 0, 1);

        PDF::Output(/* public_path('report.pdf'), 'F' */);
    }

}