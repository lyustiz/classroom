<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersSeeder::class);
        $this->call(ActividadSeeder::class);
        $this->call(ActividadCargaHorariaSeeder::class);
        $this->call(AgendaSeeder::class);
        $this->call(AlumnoSeeder::class);
        $this->call(AlumnoMateriaSeeder::class);
        $this->call(ArchivoSeeder::class);
        $this->call(AreaEstudioSeeder::class);
        $this->call(AulaSeeder::class);
        $this->call(BarrioSeeder::class);
        $this->call(CalendarioSeeder::class);
        $this->call(CalificacionSeeder::class);
        $this->call(CargaHorariaSeeder::class);
        $this->call(CargoSeeder::class);
        $this->call(CiudadSeeder::class);
        $this->call(ClaseSeeder::class);
        $this->call(ColegioSeeder::class);
        $this->call(ComunaSeeder::class);
        $this->call(ConfiguracionSeeder::class);
        $this->call(ContactoSeeder::class);
        $this->call(DepartamentoSeeder::class);
        $this->call(DetalleHorarioSeeder::class);
        $this->call(DirectivaSeeder::class);
        $this->call(DocenteSeeder::class);
        $this->call(DocenteGrupoSeeder::class);
        $this->call(DocenteMateriaSeeder::class);
        $this->call(DocumentoSeeder::class);
        $this->call(EmpleadoSeeder::class);
        $this->call(EstadoCivilSeeder::class);
        $this->call(EstructuraSeeder::class);
        $this->call(EvaluacionSeeder::class);
        $this->call(EvaluacionAlumnoSeeder::class);
        $this->call(FeriadoSeeder::class);
        $this->call(FotoSeeder::class);
        $this->call(GradoSeeder::class);
        $this->call(GradoAlumnoSeeder::class);
        $this->call(GradoMateriaSeeder::class);
        $this->call(GrupoSeeder::class);
        $this->call(GrupoAlumnoSeeder::class);
        $this->call(GrupoCalificacionSeeder::class);
        $this->call(HoraAcademicaSeeder::class);
        $this->call(HorarioSeeder::class);
        $this->call(InasistenciaSeeder::class);
        $this->call(JornadaSeeder::class);
        $this->call(MateriaSeeder::class);
        $this->call(MatriculaSeeder::class);
        $this->call(MenuSeeder::class);
        $this->call(ModuloSeeder::class);
        $this->call(NivelSeeder::class);
        $this->call(NivelCalificacionSeeder::class);
        $this->call(PagoSeeder::class);
        $this->call(PaisSeeder::class);
        $this->call(ParentescoSeeder::class);
        $this->call(ParienteSeeder::class);
        $this->call(PerfilSeeder::class);
        $this->call(PeriodoSeeder::class);
        $this->call(PermisoSeeder::class);
        $this->call(PlanDetalleSeeder::class);
        $this->call(PlanEvaluacionSeeder::class);
        $this->call(RecursoSeeder::class);
        $this->call(StatusSeeder::class);
        $this->call(SuscripcionSeeder::class);
        $this->call(TelefonoSeeder::class);
        $this->call(TipoActividadSeeder::class);
        $this->call(TipoAgendaSeeder::class);
        $this->call(TipoArchivoSeeder::class);
        $this->call(TipoCalificacionSeeder::class);
        $this->call(TipoColegioSeeder::class);
        $this->call(TipoCondicionSeeder::class);
        $this->call(TipoContactoSeeder::class);
        $this->call(TipoDirectivaSeeder::class);
        $this->call(TipoDocumentoSeeder::class);
        $this->call(TipoEvaluacionSeeder::class);
        $this->call(TipoFeriadoSeeder::class);
        $this->call(TipoFotoSeeder::class);
        $this->call(TipoPagoSeeder::class);
        $this->call(TipoRecursoSeeder::class);
        $this->call(TipoTelefonoSeeder::class);
        $this->call(TipoUsuarioSeeder::class);
        $this->call(TurnoSeeder::class);
        $this->call(UbicacionSeeder::class);
        $this->call(UsuarioSeeder::class);
        $this->call(UsuarioPerfilSeeder::class);
        $this->call(ZonaSeeder::class);
    }
}
