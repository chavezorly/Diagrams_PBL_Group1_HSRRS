<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\TicketSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Tickets';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ticket-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Ticket', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'tick_closed_date',
            'tick_status',
            'tick_priority',
            'tick_startDate',
            // 'tick_description',
            // 'tick_timelimit',
            // 'ticket_type_id',
            // 'department_id',
            // 'room_room_no',
            // 'user_idCreated',
            // 'user_id1Assigned',
            // 'user_id2closed',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
