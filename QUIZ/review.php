<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

$user_id = $_SESSION['user_id'];

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['answers'])) {
    $answers = $_POST['answers'];
    
    foreach ($answers as $question_id => $answer_id) {
        $stmt = $pdo->prepare("REPLACE INTO user_answers (user_id, question_id, answer_id) VALUES (:user_id, :question_id, :answer_id)");
        $stmt->execute([
            'user_id' => $user_id,
            'question_id' => $question_id,
            'answer_id' => $answer_id
        ]);
    }
    header("Location: result.php");
    exit();
}

$stmt = $pdo->prepare("
    SELECT q.id AS question_id, q.question_text, a.id AS answer_id, a.answer_text
    FROM questions q
    JOIN answers a ON q.id = a.question_id
    ORDER BY q.id
");
$stmt->execute();
$questions = $stmt->fetchAll(PDO::FETCH_GROUP | PDO::FETCH_ASSOC);

$user_answers = $_SESSION['answers'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Answers</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/indexstyle.css" rel="stylesheet">
</head>
<body>
    <div class="container text-center">
        <h1 class="mb-4">Review Your Answers</h1>
        <form action="review.php" method="POST">
            <?php foreach ($questions as $question_id => $question): ?>
                <div class="mb-4">
                    <p><strong><?php echo htmlspecialchars($question[0]['question_text']); ?></strong></p>
                    <?php foreach ($question as $answer): ?>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" name="answers[<?php echo $question_id; ?>]" value="<?php echo $answer['answer_id']; ?>" <?php echo isset($user_answers[$question_id]) && $user_answers[$question_id] == $answer['answer_id'] ? 'checked' : ''; ?> required>
                            <label class="form-check-label"><?php echo htmlspecialchars($answer['answer_text']); ?></label><br>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endforeach; ?>
            <button type="submit" class="btn btn-primary">Confirm Answers</button>
        </form>
    </div>
</body>
</html>
