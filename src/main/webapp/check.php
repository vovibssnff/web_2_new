<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);


$val_x = $_GET['val_x'] ?? null;
$val_y = $_GET['val_y'] ?? null;
$val_r = $_GET['val_r'] ?? null;

if (!preg_match('/^-?\d+$/', $val_x)) {
    header('Content-Type: text/plain');
    echo 'x_error: invalid x value';
    exit;
}

if (!preg_match('/^-?\d+$/', $val_y)) {
    header('Content-Type: text/plain');
    echo 'y_error: invalid y value';
    exit;
}

// Validate val_r
$allowed_r_values = [1, 1.5, 2, 2.5, 3];
if (!is_numeric($val_r) || !in_array($val_r, $allowed_r_values)) {
    header('Content-Type: text/plain');
    echo 'r_error: invalid r value';
    exit;
}

if ((0 <= $val_x && $val_x <= $val_r && 0 <= $val_y && $val_y <= $val_r / 2 && $val_y <= -($val_x / 2) + 2) ||
    ($val_x * $val_x + $val_y * $val_y <= $val_r * $val_r / 4 && $val_x <= 0 && $val_y >= 0) ||
    (-$val_r <= $val_x && $val_x <= 0 && -$val_r <= $val_y && $val_y <= 0)) {

    header('Content-Type: text/plain');
    echo 'true';
} else {
    // Handle invalid or missing input data
    header('Content-Type: text/plain');
    echo 'false';
}
