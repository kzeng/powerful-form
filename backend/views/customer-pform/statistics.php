<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

$this->title = '客户表单数据统计';
$this->params['breadcrumbs'][] = $this->title;

$command = \Yii::$app->db->createCommand('SELECT id,title FROM pform_field where pform_uid = "' . Yii::$app->request->get('uid') .'"');
$pformfield = $command->queryAll();
$command = \Yii::$app->db->createCommand('SELECT * FROM customer_pform where pform_uid = "' . Yii::$app->request->get('uid') .'"');
$customer_pform = $command->queryAll();
$customer_pform = ArrayHelper::map($customer_pform, 'pform_field_id', 'value', 'customer_pform_uid');
?>
<div class="customer-pform-index">
    <h1><?= Html::encode($this->title) ?></h1>
    <?php if ( $customer_pform ) { ?>
        <table class='table'>
            <tr>
                <?php foreach ( $pformfield as $key => $value ) { ?>
                    <th><?php echo $value['title'];?></th>
                <?php } ?>
            </tr>
            <?php foreach ( $customer_pform as $key => $value ) { ?>
                <tr>
                    <?php foreach ( $pformfield as $k => $val ) { ?>
                        <td><?php echo $value[$val['id']]; ?></td>
                    <?php } ?>
                </tr>
            <?php } ?>
        </table>
    <?php } ?>
</div>
