<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;
use yii\bootstrap\modal;
use yii\bootstrap\Tabs;
use kartik\tabs\TabsX;

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
        <?= Html::button('Create Ticket', ['value'=>URL::to('index.php?r=ticket/create'),'class' => 'btn btn-success','id'=>'modalButton']) ?>
    </p>


     <?php

   echo TabsX::widget([
    'position' => TabsX::POS_ABOVE,
    'align' => TabsX::ALIGN_LEFT,
    'items' => [
        [
            'label' => 'Ticket',
            'active' => true
        ],
        [
            'label' => 'Open',
            'headerOptions' => ['style'=>'font-weight:bold'],
             
        ],
       [
            'label' => 'Escalated',
            'headerOptions' => ['style'=>'font-weight:bold'],
                   ],
         [
            'label' => 'Closed',
            'headerOptions' => ['style'=>'font-weight:bold'],
         
        ],
        

    ],
]);
        Modal::begin([
                'header'=>'<h3>Create Ticket</h3>',
                'id'=>'modal',
                'size'=>'modal-lg',
                ]);

        echo "<div id ='modalContent'></div>";


            Modal::end();



    ?>

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
