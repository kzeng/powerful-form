<?php

namespace backend\models;

use Yii;
use yii\behaviors\TimestampBehavior;
/**
 * This is the model class for table "pform".
 *
 * @property integer $id
 * @property string $uid
 * @property string $title
 * @property integer $create_at
 * @property integer $updated_at
 * @property integer $user_id
 * @property string $description
 */
class Pform extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pform';
    }

    public function behaviors() {
        return [
            TimestampBehavior::className(),
        ];
    }
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['uid', 'title', 'created_at', 'updated_at', 'user_id', 'description'], 'required'],
            [['created_at', 'updated_at', 'user_id'], 'integer'],
            [['uid'], 'string', 'max' => 64],
            [['title'], 'string', 'max' => 255],
            [['description'], 'string', 'max' => 512],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'uid' => '唯一编码',
            'title' => '表单名称',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
            'user_id' => '创建者',
            'description' => '简要描述',
        ];
    }


    public static function addMetadataAjax($form_uid, $field_title, $field_type, $field_value, $field_placeholder, $field_order ) {
        /*
         * @property integer $id
         * @property string $title
         * @property integer $type
         * @property string $value
         * @property string $placeholder
         * @property integer $sort
         * @property string $pform_uid
        */
        // var form_uid;
        // var field_title;
        // var field_type;
        // var field_value;
        // var field_placeholder;
        // var field_order;

        $metadata = new \backend\models\PformField;

        $metadata->title = $field_title;
        $metadata->type = $field_type;
        $metadata->value = $field_value;
        $metadata->placeholder = $field_placeholder;
        $metadata->sort = $field_order;
        $metadata->pform_uid = $form_uid;

        $metadata->save(false);

        return \yii\helpers\Json::encode(['code' => 0]);
    }
    

    static function getFormField($model)
    {
        $formfields = \backend\models\PformField::find()
                        ->where(["pform_uid" => $model->uid])
                        ->all();

        $field_str = "";
        if(empty($formfields))
            return $field_str;

        foreach ($formfields as $formfield) {
            $field_str = $field_str."【".$formfield->title."】<br>";
        }
        return "<span style='color:blue; font-size:14pt'>".$field_str."</span>";
    }



}
