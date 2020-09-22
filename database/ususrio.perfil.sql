SELECT
    `classroom`.`usuario`.`nb_nombres` AS `nb_nombres`,
    `classroom`.`usuario`.`nb_usuario` AS `nb_usuario`,
    `classroom`.`usuario`.`tx_email` AS `tx_email`,
    `classroom`.`usuario`.`id_status` AS `id_status`,
    `classroom`.`status`.`nb_status` AS `nb_status`,
    (
    SELECT
        1
    FROM
        `classroom`.`usuario_perfil` `upe`
    WHERE
        `upe`.`id_usuario` = `classroom`.`usuario`.`id` AND `upe`.`id_perfil` = 1
) AS `id_secretaria`,
(
    SELECT
        'SI'
    FROM
        `classroom`.`usuario_perfil` `upe`
    WHERE
        `upe`.`id_usuario` = `classroom`.`usuario`.`id` AND `upe`.`id_perfil` = 1
) AS `nb_secretaria`,
(
    SELECT
        1
    FROM
        `classroom`.`usuario_perfil` `upe`
    WHERE
        `upe`.`id_usuario` = `classroom`.`usuario`.`id` AND `upe`.`id_perfil` = 2
) AS `id_docente`,
(
    SELECT
        'SI'
    FROM
        `classroom`.`usuario_perfil` `upe`
    WHERE
        `upe`.`id_usuario` = `classroom`.`usuario`.`id` AND `upe`.`id_perfil` = 2
) AS `bo_docente`,
(
    SELECT
        1
    FROM
        `classroom`.`usuario_perfil` `upe`
    WHERE
        `upe`.`id_usuario` = `classroom`.`usuario`.`id` AND `upe`.`id_perfil` = 3
) AS `id_alumno`,
(
    SELECT
        'SI'
    FROM
        `classroom`.`usuario_perfil` `upe`
    WHERE
        `upe`.`id_usuario` = `classroom`.`usuario`.`id` AND `upe`.`id_perfil` = 3
) AS `bo_alumno`,
(
    SELECT
        1
    FROM
        `classroom`.`usuario_perfil` `upe`
    WHERE
        `upe`.`id_usuario` = `classroom`.`usuario`.`id` AND `upe`.`id_perfil` = 4
) AS `id_acudiente`,
(
    SELECT
        'SI'
    FROM
        `classroom`.`usuario_perfil` `upe`
    WHERE
        `upe`.`id_usuario` = `classroom`.`usuario`.`id` AND `upe`.`id_perfil` = 4
) AS `bo_acudiente`,
(
    SELECT
        1
    FROM
        `classroom`.`usuario_perfil` `upe`
    WHERE
        `upe`.`id_usuario` = `classroom`.`usuario`.`id` AND `upe`.`id_perfil` = 4
) AS `id_empleado`,
(
    SELECT
        'SI'
    FROM
        `classroom`.`usuario_perfil` `upe`
    WHERE
        `upe`.`id_usuario` = `classroom`.`usuario`.`id` AND `upe`.`id_perfil` = 4
) AS `bo_empleado`,
(
    SELECT
        1
    FROM
        `classroom`.`usuario_perfil` `upe`
    WHERE
        `upe`.`id_usuario` = `classroom`.`usuario`.`id` AND `upe`.`id_perfil` = 4
) AS `id_admin`,
(
    SELECT
        'SI'
    FROM
        `classroom`.`usuario_perfil` `upe`
    WHERE
        `upe`.`id_usuario` = `classroom`.`usuario`.`id` AND `upe`.`id_perfil` = 4
) AS `bo_admin`
FROM
    (
        (
            `classroom`.`usuario`
        JOIN `classroom`.`tipo_usuario` ON
            (
                `classroom`.`usuario`.`id_tipo_usuario` = `classroom`.`tipo_usuario`.`id`
            )
        )
    JOIN `classroom`.`status` ON
        (
            `classroom`.`usuario`.`id_status` = `classroom`.`status`.`id`
        )
    )