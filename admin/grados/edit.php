<?php

$id_grado = $_GET['id'];

include ('../../app/config.php');
include ('../../admin/layout/parte1.php');

include ('../../app/controllers/grados/datos_grados.php');
include ('../../app/controllers/niveles/listado_de_niveles.php');

?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <br>
        <div class="content">
            <div class="container">
                <div class="row">
                    <h1>Modificación de grado: <?=$curso;?></h1>
                </div>
                <br>
                <div class="row">

                    <div class="col-md-6">
                        <div class="card card-outline card-success">
                            <div class="card-header">
                                <h3 class="card-title">Llene los datos</h3>
                            </div>
                            <div class="card-body">
                                <form action="<?=APP_URL;?>/app/controllers/grados/update.php" method="post">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="">Nivel</label>
                                                <input type="text" name="id_grado" value="<?=$id_grado;?>" hidden>
                                                <select name="nivel_id" id="" class="form-control">
                                                    <?php
                                                    foreach ($niveles as $nivele){
                                                        ?>
                                                        <option value="<?=$nivele['id_nivel'];?>"<?=$nivel_id==$nivele['id_nivel'] ? 'selected' : ''?>><?=$nivele['nivel']." - ".$nivele['turno'];?></option>
                                                        <?php

                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="">Curso</label>
                                                <select name="curso" class="form-control">
                                                    <option value="PÁRVULOS" <?= $curso=='PÁRVULOS' ? 'selected' : '' ?>>PÁRVULOS</option>
                                                    <option value="PREKÍNDER" <?= $curso=='PREKÍNDER' ? 'selected' : '' ?>>PREKÍNDER</option>
                                                    <option value="KÍNDER" <?= $curso=='KÍNDER' ? 'selected' : '' ?>>KÍNDER</option>

                                                    <option value="1° PRIMARIA" <?= $curso=='1° PRIMARIA' ? 'selected' : '' ?>>1° PRIMARIA</option>
                                                    <option value="2° PRIMARIA" <?= $curso=='2° PRIMARIA' ? 'selected' : '' ?>>2° PRIMARIA</option>
                                                    <option value="3° PRIMARIA" <?= $curso=='3° PRIMARIA' ? 'selected' : '' ?>>3° PRIMARIA</option>
                                                    <option value="4° PRIMARIA" <?= $curso=='4° PRIMARIA' ? 'selected' : '' ?>>4° PRIMARIA</option>
                                                    <option value="5° PRIMARIA" <?= $curso=='5° PRIMARIA' ? 'selected' : '' ?>>5° PRIMARIA</option>
                                                    <option value="6° PRIMARIA" <?= $curso=='6° PRIMARIA' ? 'selected' : '' ?>>6° PRIMARIA</option>

                                                    <option value="1° BÁSICOS" <?= $curso=='1° BÁSICOS' ? 'selected' : '' ?>>1° BÁSICOS</option>
                                                    <option value="2° BÁSICOS" <?= $curso=='2° BÁSICOS' ? 'selected' : '' ?>>2° BÁSICOS</option>
                                                    <option value="3° BÁSICOS" <?= $curso=='3° BÁSICOS' ? 'selected' : '' ?>>3° BÁSICOS</option>

                                                    <option value="4° BACHILLERATO" <?= $curso=='4° BACHILLERATO' ? 'selected' : '' ?>>4° BACHILLERATO</option>
                                                    <option value="5° BACHILLERATO" <?= $curso=='5° BACHILLERATO' ? 'selected' : '' ?>>5° BACHILLERATO</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="">Turnos</label>
                                                <select name="paralelo" class="form-control">
                                                    <option value="A"<?= $paralelo=='A' ? 'selected' : '' ?>>A</option>
                                                    <option value="B"<?= $paralelo=='B' ? 'selected' : '' ?>>B</option>
                                                    <option value="C"<?= $paralelo=='C' ? 'selected' : '' ?>>C</option>
                                                    <option value="D"<?= $paralelo=='D' ? 'selected' : '' ?>>D</option>
                                                    <option value="E"<?= $paralelo=='E' ? 'selected' : '' ?>>E</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-success">Actualizar</button>
                                                <a href="<?=APP_URL;?>/admin/grados" class="btn btn-secondary">Cancelar</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

<?php

include ('../../admin/layout/parte2.php');
include ('../../layout/mensajes.php');

?>