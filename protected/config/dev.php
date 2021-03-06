<?php
error_reporting(E_ALL);

return CMap::mergeArray(
	require(dirname(__FILE__).'/main.php'),
	array(
		'components'=>array(
			'fixture'=>array(
				'class'=>'system.test.CDbFixtureManager',
			),
			'db'=>array(
				'connectionString' => 'mysql:host=127.0.0.1;dbname=yeptap',
				'emulatePrepare' => true,
				'username' => 'root',
				'password' => 'root',
				'charset' => 'utf8',
				'enableProfiling'=>true,
				'enableParamLogging'=>true,
			),	
			'assetManager' => array(
				'linkAssets' => true,
			),
			/*'log'=>array(
				'class'=>'CLogRouter',
				'routes'=>array(
					array(
						// uncomment the following to show log messages on web pages
						//'class'=>'CWebLogRoute',
						'class'=>'ext.yii-debug-toolbar.YiiDebugToolbarRoute',
						// Access is restricted by default to the localhost
						'ipFilters'=>array('127.0.0.1','192.168.1.*'),
					),
				),
			),*/
		),
		'modules'=>array(
			'backup',
            'gii'=>array(
                'class'=>'system.gii.GiiModule',
                'password'=>'admin',
                // If removed, Gii defaults to localhost only. Edit carefully to taste.
                'ipFilters'=>array('127.0.0.1','::1'),
            ),
		),
	)
);
