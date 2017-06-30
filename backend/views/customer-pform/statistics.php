<?php

use yii\helpers\Html;
use yii\grid\GridView;

$this->title = '客户表单数据统计';
$this->params['breadcrumbs'][] = $this->title;

$data = \backend\models\CustomerPform::statistic();
?>
<div class="customer-pform-index">
    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a('导出', ['exportstats', 'uid' => Yii::$app->request->get('uid')], ['class' => 'btn btn-success']) ?>
    </p>
    <?php if ( $data ) { ?>
        <table class='table'>
            <tr>
                <?php foreach ( $data['title'] as $column_title ) { ?>
                    <th><?php echo $column_title;?></th>
                <?php } ?>
            </tr>
            <?php foreach ( $data['data'] as $row_value ) { ?>
                <tr>
                    <?php foreach ( $row_value as $val ) { ?>
                        <td><?php echo $val; ?></td>
                    <?php } ?>
                </tr>
            <?php } ?>
        </table>
    <?php } ?>
</div>
