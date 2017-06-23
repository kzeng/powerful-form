<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CustomerPform */

$this->title = 'Create Customer Pform';
$this->params['breadcrumbs'][] = ['label' => 'Customer Pforms', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customer-pform-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
