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
            [['uid', 'title', 'create_time', 'updated_at', 'user_id', 'description'], 'required'],
            [['create_time', 'updated_at', 'user_id'], 'integer'],
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
}
