<?php

namespace app\models;

use Yii;
use yii\data\ActiveDataProvider;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "contacts".
 *
 * @property int $id
 * @property string $firstname
 * @property string $middlename
 * @property string $lastname
 * @property string $email
 * @property string $phone
 * @property string $comment
 * @property boolean $currentUserFavorite
 */
class contacts extends ActiveRecord
{
    public $currentUserFavorite;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'contacts';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['firstname', 'middlename', 'lastname', 'email', 'phone', 'comment'], 'required'],
            [['firstname', 'middlename', 'lastname'], 'string', 'max' => 32],
            [['email', 'comment'], 'string', 'max' => 128],
            [['phone'], 'string', 'max' => 16],
            [['currentUserFavorite'], 'boolean'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'firstname' => 'Имя',
            'middlename' => 'Отчество',
            'lastname' => 'Фамилия',
            'email' => 'Email',
            'phone' => 'Телефон',
            'comment' => 'Комментарии',
            'currentUserFavorite' => 'Избранный',
        ];
    }

    /**
     * @param $params
     * @return ActiveDataProvider
     */
    public function favoritesList($params)
    {
        $query = Contacts::find()->join('INNER JOIN', 'favorites', 'favorites.contact_id = contacts.id AND favorites.user_id = ' . Yii::$app->user->identity->id);

        return new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => 20,
            ],
        ]);
    }

    /**
     * @param $params
     * @return ActiveDataProvider
     */
    public function contactList($params)
    {
        $currentUserId = Yii::$app->user->identity->id;
        $query = Contacts::find()
            ->select('contacts.*, !ISNULL(favorites.id) as currentUserFavorite')
            ->join('LEFT JOIN', 'favorites', 'favorites.contact_id = contacts.id AND favorites.user_id = ' . $currentUserId);

        return new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => 20,
            ],
        ]);
    }

    /**
     * @param $params
     * @throws \yii\db\Exception
     */
    public function toggleFavorite($params)
    {
        if (!isset($params['id'])) {
            return;
        }

        $currentUserId = Yii::$app->user->identity->id;
        $favorites = Yii::$app->db->createCommand('SELECT contact_id FROM favorites WHERE user_id = ' . $currentUserId)
            ->queryColumn();

        if (in_array($params['id'], $favorites)) {
            Yii::$app->db->createCommand()->delete('favorites',
                'contact_id = ' . $params['id'] . ' AND user_id = ' . $currentUserId
            )->execute();
        } else {
            Yii::$app->db->createCommand()->insert('favorites', [
                'contact_id' => $params['id'],
                'user_id' => $currentUserId,
            ])->execute();
        }
    }
}
