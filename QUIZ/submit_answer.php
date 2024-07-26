<?php
session_start();
require 'db.php';

$response = ['status' => 'error', 'message' => ''];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user_id = $_SESSION['user_id'];
    $question_id = $_POST['question_id'];
    $answer_id = $_POST['answer'];

    $stmt = $pdo->prepare("INSERT INTO user_answers (user_id, question_id, answer_id) VALUES (:user_id, :question_id, :answer_id)");
    if ($stmt->execute(['user_id' => $user_id, 'question_id' => $question_id, 'answer_id' => $answer_id])) {
        $_SESSION['question_index']++;
        $response['status'] = 'success';
    } else {
        $response['message'] = 'Failed to save answer.';
    }
}

echo json_encode($response);
