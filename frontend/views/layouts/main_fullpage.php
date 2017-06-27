<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    <link rel="stylesheet" href="http://cdn.dowebok.com/77/css/jquery.fullPage.css">
    <script src="http://cdn.dowebok.com/77/js/jquery.fullPage.min.js"></script>

    <style>
        .section1 { background: url(http://idowebok.u.qiniudn.com/77/1.jpg) 50%;}
        .section2 { background: url(http://idowebok.u.qiniudn.com/77/2.jpg) 50%;}
        .section3 { background: url(http://idowebok.u.qiniudn.com/77/3.jpg) 50%;}
        .section4 { background: url(http://idowebok.u.qiniudn.com/77/4.jpg) 50%;}
    </style>


</head>
<body>
<?php $this->beginBody() ?>



<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
