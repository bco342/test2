<?php

use yii\bootstrap\Tabs;
use yii\grid\GridView;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Contacts */

$this->title = 'Список контактов';

?>
<div class="contacts-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= Tabs::widget([
        'items' => [
            [
                'label' => 'Полный список',
                'content' => GridView::widget([
                    'dataProvider' => $model->contactList(Yii::$app->request->get()),
                    'layout' => '{items} {pager}',
                    'columns' => [
                        [
                            'class' => 'yii\grid\ActionColumn',
                            'template' => '{index}',
                            'buttons' => [
                                'index' => function ($url, $model) {
                                    $icon = $model->currentUserFavorite ? 'glyphicon-heart' : 'glyphicon-heart-empty';
                                    return Html::a(
                                        '<span class="glyphicon ' . $icon . '"></span>',
                                        $url);
                                },
                            ],
                        ],
                        'firstname',
                        'middlename',
                        'lastname',
                        'email:email',
                        'phone',
                        'comment',
                    ],
                ]),
                'active' => true
            ],
            [
                'label' => 'Мои любимки',
                'content' => GridView::widget([
                    'dataProvider' => $model->favoritesList(Yii::$app->request->get()),
                    'layout' => '{items} {pager}',
                    'columns' => [
                        'firstname',
                        'middlename',
                        'lastname',
                        'email:email',
                        'phone',
                        'comment',
                    ],
                ])
            ]
        ]
    ]); ?>


</div>
