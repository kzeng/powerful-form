<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\PformBackcover */

$this->title = 'Create Pform Backcover';
$this->params['breadcrumbs'][] = ['label' => 'Pform Backcovers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pform-backcover-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
