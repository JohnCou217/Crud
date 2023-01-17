<?php
require('fpdf.php');

class PDF extends FPDF
{

function Header()
{
    
    $this->SetFont('Arial','',20);
    
    $this->Cell(50);
    $this->Cell(100,10,'Servicio Social',1,0,'C');
    $this->Ln(20);
}
function Footer()
{
    
    $this->SetY(-15);
   
    $this->SetFont('Arial','I',8);
    
    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
}
}
require 'conexion.php';
$consulta = "SELECT * FROM alumnos WHERE TipoServ = 'Social';";
$resultado= mysqli_query($conn, $consulta);

$pdf = new PDF();
$pdf->AddPage('LANDSCAPE', 'LEGAL');


$pdf->SetFont('Arial','',8);
$pdf->SetFillColor(0,0,0);
$pdf->SetTextColor(240, 255, 240); 
$pdf->Cell(1);
$pdf->Cell(55,10,'Nombre',1,0,'C',true);
$pdf->Cell(25,10,'Institucion',1,0,'C',true);
$pdf->Cell(35,10,'Tipo Servicio',1,0,'C',true);
$pdf->Cell(20,10,'Horas',1,0,'C',true);
$pdf->Cell(40,10,'Fecha',1,0,'C',true);
$pdf->Cell(40,10,'Area',1,0,'C',true);
$pdf->Cell(75,10,'Direccion',1,0,'C',true); 
$pdf->Cell(35,10,'NumCel',1,0,'C',true);
$pdf->Cell(35,10,'Correo',1,0,'C',true);
$pdf->Cell(35,10,'NumEmerg',1,1,'C',true);
$pdf->SetFillColor(229, 229, 229);
$pdf->SetTextColor(3, 3, 3); 

while($row = $resultado->fetch_assoc()){
$pdf->Cell(1);
$pdf->Cell(55, 10, $row['Nombre'],1, 0,'C', 0 );
$pdf->Cell(25, 10, $row['Institucion'],1, 0,'C', 0 );
$pdf->Cell(35, 10, $row['TipoServ'],1, 0,'C', 0 );
$pdf->Cell(20, 10, $row['Horas'],1, 0,'C', 0 );
$pdf->Cell(40, 10, $row['Fecha'],1, 0,'C', 0 );
$pdf->Cell(40, 10, $row['Area'],1, 0,'C', 0 );
$pdf->Cell(75, 10, $row['Direccion'],1, 0,'C', 0 );
$pdf->Cell(35, 10, $row['NumCel'],1, 0,'C', 0 );
$pdf->Cell(35, 10, $row['Correo'],1, 0,'C', 0 );
$pdf->Cell(35, 10, $row['NumEmerg'],1, 1,'C', 0 );
}

$pdf->Output();
?>