<?php 
use miloschuman\highcharts\Highcharts;

$this->title = 'Dashboard'; ?>


<div class="site-about">
    <h1>Dashboard</h1>
    <p>
  <?php      
echo Highcharts::widget([
   'options' => [
      'title' => ['text' => 'Ticket Bookings'],
      'xAxis' => [
         'categories' => ['September', 'October']
      ],
      'yAxis' => [
         'title' => ['text' => 'Fruit eaten']
      ],
      'series' => [
         ['name' => 'Housekeeping', 'data' => [8, 5]],
         ['name' => 'Engineering', 'data' => [5, 7]]
      ]
   ]
]);
 ?>




    </p>
</div>