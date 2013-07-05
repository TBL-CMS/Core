<?php
/* @var $this DemoController */
/* @var $model Demo */
/* @var $form CActiveForm */
?>

<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm', array(
	'id'=>'demo-form',
	'enableAjaxValidation'=>false,
	'type'=>'horizontal',
	'htmlOptions'=>array('class'=>'form-horizontal')
)); ?>

	<?php if( $form->errorSummary($model)  ) { ?>
	<div class="row-fluid">
      <div class="widget widget-padding span12">
        <div class="widget-header">
          <i class="icon-external-link"></i><h5>Errors:</h5>
          <div class="widget-buttons">
              <a href="#" data-title="Collapse" data-collapsed="false" class="tip collapse"><i class="icon-chevron-up"></i></a>
          </div>
        </div>
        <div class="widget-body">
          <div class="alert alert-info" style="margin:0;">
            <?php echo $form->errorSummary($model); ?>
          </div>
        </div>
      </div>
    </div>
    <?php } ?>
    
<?php if(\Yii::app()->user->hasFlash('success')):?>
<div class="alert alert-success">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Success!</strong>  
</div>
<?php endif; ?>

<div class="row-fluid">
  <div class="widget widget-padding span12" id="wizard">
		
    <div class="widget-header">
      <ul class="nav nav-tabs">
        <li><a href="#validate_tab1" data-toggle="tab">Basic Info</a></li>
        <li><a href="#validate_tab2" data-toggle="tab">Media</a></li>
      </ul>
    </div>
    <div class="widget-body">
      <div class="tab-content">     
        
      	<div class="tab-pane" id="validate_tab1">
        		          <?php echo $form->textFieldRow($model,'title',array('class'=>'span5','maxlength'=>255)); ?>
          		          <?php echo $form->textFieldRow($model,'created',array('class'=>'span5')); ?>
          		          <?php echo $form->textFieldRow($model,'updated',array('class'=>'span5')); ?>
          		          <?php echo $form->textFieldRow($model,'listing_order',array('class'=>'span5')); ?>
          		          <?php echo $form->textFieldRow($model,'active',array('class'=>'span5')); ?>
          		          <?php echo $form->textFieldRow($model,'deleted',array('class'=>'span5')); ?>
          	      	</div>
      	
      	<div class="tab-pane" id="validate_tab2"> 
	      	<!-- Media manager here -->
	      	<?php $this->widget('cms.widgets.CmsMediaManager', array('model'=>$model, 'type'=>'demo')) ?>
	    </div>
      	 
      </div>
    </div>
    <div class="widget-footer">
    	<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save', array('class'=>'btn btn-primary')); ?>
    </div>
    
  </div>
</div>  

<?php $this->endWidget(); ?>
