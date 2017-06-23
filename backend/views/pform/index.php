<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\PformSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '用户表单';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pform-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('创建表单', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            'id',
            //'uid',
            'title',
            'description',

            [
                'label' => '包含字段',
                'value'=>function ($model, $key, $index, $column) {

                    $formfields = \backend\models\PformField::find()
                                    ->where(["pform_uid" => $model->uid])
                                    ->all();

                    $field_str = "";
                    if(empty($formfields))
                        return $field_str;

                    foreach ($formfields as $formfield) {
                        $field_str = $field_str."【".$formfield->title."】<br>";
                    }
                    return "<span style='color:blue; font-size:12pt'>".$field_str."</span>";
                },
                'format' => 'html',
                //'filter' => \common\models\CampaignOrder::getGhOption(),
                'headerOptions' => array('style'=>'width:25%;'),
            ],

            // 'created_at:datetime',
            // 'updated_at:datetime',
            // 'user_id',
            // 'description',

            ['class' => 'yii\grid\ActionColumn'],
            // [
            //     'class' => 'yii\grid\ActionColumn', 
            //     'template' => '{update}   {delete}',
            //     'headerOptions' => array('style'=>'width:12%;'),
            // ],

        ],
    ]); ?>
</div>
