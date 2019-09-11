<?php

use Jasny\ValidationResult;
use Jasny\SSO;

class MySSOServer extends SSO\Server {

    private $db;

    public function __construct(array $options = []) {
        parent::__construct($options);
        $this->db = new Database();
    }

    protected function getBrokerInfo($brokerId) {
        $result = $this->db->select("SELECT * FROM as_user_apps WHERE app_id = '$brokerId'");
        $brokers = mysqli_fetch_array($result, MYSQLI_ASSOC);
        if ($brokers > 0) {
            return $brokers;
        } else {
            return null;
        }
    }

    protected function authenticate($username, $password) {
        if (!isset($username)) {
            return ValidationResult::error("username isn't set");
        }
        if (!isset($password)) {
            return ValidationResult::error("password isn't set");
        }

        $result = $this->db->select("SELECT * FROM as_users WHERE username = '$username'");
        $user = mysqli_fetch_array($result, MYSQLI_ASSOC);

        if ($user['username'] !== $username) {
            return ValidationResult::error("Invalid username!");
        }

        define('PASSWORD_BCRYPT_COST', "13");
        define('PASSWORD_SALT', "7cHKorDQoW6rlMocJowFLd");
        $salt = "$2a$" . PASSWORD_BCRYPT_COST . "$" . PASSWORD_SALT;
        $passwordx = crypt(hash('sha512', $password), $salt);

        if ($passwordx !== $user['password']) {
            return ValidationResult::error("Invalid password!");
        }

        return ValidationResult::success();
    }

    protected function getUserInfo($username) {
        $result = $this->db->select("SELECT * FROM as_users WHERE username = '$username'");
        $user = mysqli_fetch_array($result, MYSQLI_ASSOC);
        unset($user['password']);
        return $user;
    }
}