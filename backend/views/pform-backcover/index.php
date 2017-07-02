<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\PformBackcoverSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Pform Backcovers';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pform-backcover-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Pform Backcover', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'content:ntext',
            'pform_uid',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
