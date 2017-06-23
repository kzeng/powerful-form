<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Pform */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => '表单', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pform-view">

    <h1>
        <?= Html::encode($this->title) ?>
        &nbsp;&nbsp;
        <button class="btn btn-success" data-toggle="modal" data-target="#myModal">新增字段 <i class="glyphicon glyphicon-plus"></i></button>
    </h1>

    <!--
    <p>
        <//?= Html::a('修改', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <//?= Html::a('删除', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '删除表单，确定?',
                'method' => 'post',
            ],
        ]) ?>
    </p>
    -->

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'uid',
            'title',
            'created_at:datetime',
            'updated_at:datetime',
            'user_id',
            'description',
        ],
    ]) ?>

</div>


<div class="modal fade"  id="myModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">新增字段</h3>
            </div>
            <div class="modal-body">

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group field-product-title">
                            <h3><P style="line-height:30px"><?= $model->title ?> </P></h3>
                            <p><?= $model->description ?></p>
                        </div>
                    </div>
                </div>

                <hr>

                <div class="form-group">
                    <label class="control-label" for="field_title">字段名称</label>
                    <input type="text" id="field_title" class="form-control" name="field_title" maxlength="32" placeholder="填写字段名称，如 名字，手机号码 ...">
                    <div class="help-block"></div>
                </div>
              
                <div class="form-group">
                    <label class="control-label" for="field_type">字段类型</label>
                    <select class="form-control" id="field_type" name="field_type">
                    <option>普通文本</option>
                    <option>电话号码</option>
                    <option>电子邮箱</option>
                    <option>单项选择</option>
                    <option>多项选择</option>
                    </select>
                    <div class="help-block"></div>
                </div>


                <div class="form-group">
                    <label class="control-label" for="field_value">字段取值范围</label>
                    <input type="text" id="field_value" class="form-control" name="field_value" maxlength="255">
                    <div class="help-block"></div>
                </div>

                <div class="form-group">
                    <label class="control-label" for="field_placeholder">字段提示语</label>
                    <input type="text" id="field_placeholder" class="form-control" name="field_placeholder" maxlength="255">
                    <div class="help-block"></div>
                </div>

                <div class="form-group">
                    <label class="control-label" for="field_order">排序</label>
                    <input type="text" id="field_order" class="form-control" name="field_order" maxlength="32">
                    <div class="help-block"></div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success" id="addMetadata">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>





