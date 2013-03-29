<div class="row-fluid">
	<h2 class="heading">Manage <?php echo $this->pluralize($this->class2name($this->modelClass)); ?>
		<div class="btn-group pull-right">
	        <button class="btn btn-primary" onclick="location.href='create'"><i class="icon-plus"></i> Create New</button>
	    </div>
	</h2>
</div>

<div class="row-fluid">
	<div class="widget widget-padding span12">
		<div class="widget-header">
              <i class="icon-group"></i>
              <h5>Manage <?php echo $this->pluralize($this->class2name($this->modelClass)); ?></h5>
              <div class="widget-buttons">
                  <a href="http://www.datatables.net/usage/" data-title="Documentation" class="tip" target="_blank"><i class="icon-external-link"></i></a>
                  <a href="#" data-title="Collapse" data-collapsed="false" class="tip collapse"><i class="icon-chevron-up"></i></a>
              </div>
            </div>  
            <div class="widget-body">
            	<!-- http://www.yiiframework.com/doc/api/1.1/CGridView#cssFile-detail -->
				<?php echo "<?php"; ?> $this->widget('zii.widgets.grid.CGridView', array(
					'id'=>'<?php echo $this->class2id($this->modelClass); ?>-grid',
					'itemsCssClass'=>'table table-striped table-bordered dataTable',
					//'enablePagination'=>false,
					'dataProvider'=>$model->search(),
					//'filter'=>$model,
					'cssFile'=>false,
					'columns'=>array(
				<?php
				$count=0;
				foreach($this->tableSchema->columns as $column)
				{
					if(++$count==5)
						echo "\t\t/*\n";
					echo "\t\t'".$column->name."',\n";
				}
				if($count>=5)
					echo "\t\t*/\n";
				?>
						array(
							'header'=>'Actions',
							'value'=>'$data->adminActions()',
							'type'=>'raw',
						),
					),
				)); ?>
            </div>
	</div>
</div>