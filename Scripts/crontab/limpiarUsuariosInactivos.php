<?php

// Script que elimina del archivo CSV los usuarios que no han iniciado
// sesión en más de 365 días. Crea un backup y guarda un log de la ejecución.


// Configuración de rutas relativas
$baseDir = './crontab';
$rutaCSV = "$baseDir/usuarios.csv";
$backupDir = "$baseDir/backups";
$rutaLog = "$baseDir/limpieza_usuarios.log";

// Crear carpetas necesarias si no existen
if (!is_dir($baseDir)) mkdir($baseDir, 0755, true);
if (!is_dir($backupDir)) mkdir($backupDir, 0755, true);

// Crear archivo CSV si no existe
if (!file_exists($rutaCSV)) {
    file_put_contents($rutaCSV, "id,nombre,email,fecha_ultimo_login\n");
}

// Crear log si no existe
if (!file_exists($rutaLog)) {
    file_put_contents($rutaLog, "==== Log de limpiezas automáticas ====\n");
}

// Crear backup con marca temporal
$timestamp = date('Ymd_His');
copy($rutaCSV, "$backupDir/usuarios.csv.backup.$timestamp");

// Calcular fecha de corte (hace 365 días)
$cutoff = new DateTime('-365 days');

// Leer CSV actual
$in = fopen($rutaCSV, 'r');
$header = fgetcsv($in);
if (!$header) {
    // Si el archivo está vacío, añadir encabezado y salir
    file_put_contents($rutaCSV, "id,nombre,email,fecha_ultimo_login\n");
    file_put_contents($rutaLog, date('Y-m-d H:i:s') . " - CSV vacío, no se procesaron usuarios.\n", FILE_APPEND);
    exit;
}

// Buscar índice de la columna fecha_ultimo_login
$indexFecha = array_search('fecha_ultimo_login', $header);
if ($indexFecha === false) $indexFecha = 3; // fallback por si cambia el orden

// Variables de control
$procesados = 0;
$eliminados = 0;
$usuariosActivos = [];
$usuariosActivos[] = $header; // mantener encabezado

// Procesar líneas del CSV
while (($row = fgetcsv($in)) !== false) {
    $procesados++;
    $fecha = trim($row[$indexFecha] ?? '');
    try {
        $fechaLogin = new DateTime($fecha);
    } catch (Exception $e) {
        // Si la fecha no es válida, se elimina
        $eliminados++;
        continue;
    }

    // Comparar con cutoff
    if ($fechaLogin < $cutoff) {
        $eliminados++;
        continue;
    } else {
        $usuariosActivos[] = $row;
    }
}
fclose($in);

// Reescribir CSV con usuarios activos
$out = fopen($rutaCSV, 'w');
foreach ($usuariosActivos as $u) {
    fputcsv($out, $u);
}
fclose($out);

// Registrar la ejecución en el log
$logLine = sprintf(
    "%s - Procesados: %d | Eliminados: %d | Fecha de corte: %s | Backup: %s\n",
    date('Y-m-d H:i:s'),
    $procesados,
    $eliminados,
    $cutoff->format('Y-m-d'),
    "$backupDir/usuarios.csv.backup.$timestamp"
);
file_put_contents($rutaLog, $logLine, FILE_APPEND);

?>