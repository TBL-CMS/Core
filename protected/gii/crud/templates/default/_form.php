<?php
/**
 * The following variables are available in this template:
 * - $this: the CrudCode object
 */
?>
<?php echo "<?php\n"; ?>
/* @var $this <?php echo $this->getControllerClass(); ?> */
/* @var $model <?php echo $this->getModelClass(); ?> */
/* @var $form CActiveForm */
?>

<?php echo "<?php \$form=\$this->beginWidget('bootstrap.widgets.TbActiveForm', array(
	'id'=>'".$this->class2id($this->modelClass)."-form',
	'enableAjaxValidation'=>false,
	'type'=>'horizontal',
	'htmlOptions'=>array('class'=>'form-horizontal')
)); ?>\n"; ?>

<?php echo "<?php if( \$form->errorSummary(\$model)  ) { ?>\n"; ?>
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
                    <?php echo "<?php echo \$form->errorSummary(\$model); ?>\n"; ?>
                </div>
            </div>
        </div>
    </div>
<?php echo "<?php } ?>\n"; ?>

<?php echo "<?php if(Yii::app()->user->hasFlash('success')):?>\n" ?>
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Success!</strong> <?php echo "<?php echo Yii::app()->user->getFlash('success'); ?>\n" ?>
    </div>
<?php echo "<?php endif; ?>\n"; ?>

    <div class="row-fluid">
        <div class="widget widget-padding span12" id="wizard">

            <div class="widget-header">
                <ul class="nav nav-tabs">
                    <li><a href="#validate_tab1" data-toggle="tab">Basic Info</a></li>
                    <li><a href="#validate_tab2" data-toggle="tab">Media</a></li>
                    <!--<li><a href="#validate_tab3" data-toggle="tab">Categories</a></li>-->
                </ul>
            </div>
            <div class="widget-body">
                <div class="tab-content">

                    <div class="tab-pane" id="validate_tab1">
                        <?php
                        foreach($this->tableSchema->columns as $column)
                        {
                            if($column->autoIncrement)
                                continue;
                            ?>
                            <?php echo "<?php echo " . $this->generateActiveRow($this->modelClass, $column) . "; ?>\n"; ?>
                        <?php
                        }
                        ?>
                    </div>

                    <div class="tab-pane" id="validate_tab2">
                        <!-- Media manager here -->
                        <?php echo "<?php \$this->widget('cms.widgets.CmsMediaManager', array('model'=>\$model, 'type'=>'".strtolower($this->modelClass)."')) ?>\n"; ?>
                    </div>

                    <div class="tab-pane" id="validate_tab3">

                        <div class="control-group">
                            <div class="controls" style="width: 250px;">

                                <?php echo "<?php /*echo \$form->checkBoxList(\$model, 'activeCategories', CmsCategories::getAllCategories('TYPE_HERE'),
							array(
								'labelOptions'=>array('class'=>'checkbox strong')
							));*/ ?>\n"; ?>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <div class="widget-footer">
                <?php echo "<?php echo CHtml::submitButton(\$model->isNewRecord ? 'Create' : 'Save', array('class'=>'btn btn-primary')); ?>\n"; ?>
            </div>

        </div>
    </div>

<?php echo "<?php \$this->endWidget(); ?>\n"; ?>