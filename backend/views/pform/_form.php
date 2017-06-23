<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Pform */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="pform-form">

    <?php $form = ActiveForm::begin(); ?>

    <!--    
        <//?= $form->field($model, 'uid')->textInput(['maxlength' => true]) ?>
    -->

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textInput(['maxlength' => true]) ?>

<!--     
    <//?= $form->field($model, 'created_at')->textInput() ?>

    <//?= $form->field($model, 'updated_at')->textInput() ?> 
-->

<!--
    <//?= $form->field($model, 'user_id')->textInput() ?>
-->

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '创建' : '更新', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
