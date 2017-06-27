<?php

/* @var $this yii\web\View */
use yii\helpers\Html;

$this->title = '超级表单';
?>
<div class="site-index">

    <div class="jumbotron">
        <h2>人人可用的在线表单工具</h2>

        <p class="lead">超级表单帮你收集和管理日常工作中的数据，把几小时的工作节约至零。</p>
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
