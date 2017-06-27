<?php

/* @var $this yii\web\View */
use yii\helpers\Html;

$this->title = '超级表单';
?>



<div id="dowebok">

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => '超级表单',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    $menuItems = [
        ['label' => '首页', 'url' => ['/site/index']],
        // ['label' => 'About', 'url' => ['/site/about']],
        // ['label' => 'Contact', 'url' => ['/site/contact']],
    ];
    if (Yii::$app->user->isGuest) {
        $menuItems[] = ['label' => '注册', 'url' => ['/site/signup']];
        $menuItems[] = ['label' => '登录', 'url' => ['/site/login']];
    } else {
        $menuItems[] = '<li>'
            . Html::beginForm(['/site/logout'], 'post')
            . Html::submitButton(
                '退出 (' . Yii::$app->user->identity->username . ')',
                ['class' => 'btn btn-link']
            )
            . Html::endForm()
            . '</li>';
    }
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => $menuItems,
    ]);
    NavBar::end();
    ?>
</div>


    <div class="section section1">
        
        <div class="jumbotron">

            <h2>人人可用的在线表单工具</h2>

            <p class="lead">超级表单帮你收集和管理日常工作中的数据，把几小时的工作节约至零。</p>

            <p>
                <a href="http://pf.mitoto.cn/admin" class="btn btn-lg btn-success">现在就去免费创建一个表单</a>
            </p>
        </div>
    </div>
    <div class="section section2"></div>
    <div class="section section3"></div>
    <div class="section section4"></div>
</div>


