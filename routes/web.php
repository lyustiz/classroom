<?php

use Illuminate\Support\Facades\Route;


Route::view('/', 'app');

Route::get('/certificado/certificadoAlumno/{certificadoAlumno}', 'Reportes\PDF\PDFCertificado@generate');

Route::view('{path}', 'app')->where('path', '(.*)');

