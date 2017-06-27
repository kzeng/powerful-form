<?php

/* @var $this yii\web\View */
use yii\helpers\Html;

$this->title = '超级表单';
?>
<div class="site-index">

    <div class="jumbotron">
        <h2>超级表单</h2>

        <p class="lead" style="color:#999">帮你轻松收集和管理客户数据</p>

        <br>
        <p>
            <a href="http://pf.mitoto.cn" class="btn btn-success">官网首页 <span class='glyphicon glyphicon-globe'></span></a>
                 &nbsp;
            <?= Html::a("免费使用 <span class='glyphicon glyphicon-cog'></span>", ['pform/index'], ['class' => 'btn btn-success']) ?>
                &nbsp;
            <?= Html::a("查看数据 <span class='glyphicon glyphicon-equalizer'></span>", ['customer-pform/index'], ['class' => 'btn btn-primary']) ?>
        </p>

    </div>

    <div class="body-content">

        <div class="row">
        
        </div>

    </div>
</div>
