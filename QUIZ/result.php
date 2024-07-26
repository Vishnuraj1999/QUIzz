<?php
session_start();
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['answers'])) {
    $user_id = $_SESSION['user_id'];
    $answers = $_POST['answers'];

    foreach ($answers as $question_id => $answer_id) {
        $stmt = $pdo->prepare("REPLACE INTO user_answers (user_id, question_id, answer_id) VALUES (:user_id, :question_id, :answer_id)");
        $stmt->execute([
            'user_id' => $user_id,
            'question_id' => $question_id,
            'answer_id' => $answer_id
        ]);
    }
}

$user_id = $_SESSION['user_id'];

$stmt = $pdo->prepare("SELECT q.id AS question_id, q.question_text, ua.answer_id, a.answer_text, a.is_correct
                       FROM questions q
                       LEFT JOIN user_answers ua ON q.id = ua.question_id AND ua.user_id = :user_id
                       LEFT JOIN answers a ON a.id = ua.answer_id
                       WHERE ua.answer_id IS NOT NULL");
$stmt->execute(['user_id' => $user_id]);
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

$total_questions = count($results);
$passed = 0;
$failed = 0;

foreach ($results as $result) {
    if (isset($result['is_correct']) && $result['is_correct'] == 1) {
        $passed++;
    } else {
        $failed++;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Results</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
   <link href="css/resultstyle.css" rel="stylesheet">
   </head>
<body>
    <div class="container text-center">
        <h1 class="mb-4">Quiz Results</h1>
        <?php foreach ($results as $result): ?>
            <div class="mb-4">
                <p><strong><?php echo htmlspecialchars($result['question_text']); ?></strong></p>
                <p class="<?php echo isset($result['is_correct']) && $result['is_correct'] == 1 ? 'correct' : 'incorrect'; ?>">
                    <?php echo htmlspecialchars($result['answer_text']); ?>
                    <?php if (isset($result['is_correct']) && $result['is_correct'] == 1): ?>
                        ✔
                    <?php else: ?>
                        ✘
                    <?php endif; ?>
                </p>
            </div>
        <?php endforeach; ?>

        <div class="result-summary">
            <h3><strong>Total Questions: <?php echo $total_questions; ?><strong></h3>
            <h3>Passed: <?php echo $passed; ?></h3>
            <h3>Failed: <?php echo $failed; ?></h3>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
