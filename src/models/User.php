<?php
  class User extends Model {
    protected static $tableName = "users";
    protected static $columns = [
      'id',
      'name',
      'email',
      'password',
      'start_date',
      'end_date',
      'is_admin'
    ];

    public static function getActiveUsersCount() {
      return static::getCount(['raw' => 'end_date IS NULL']);
    }
  }