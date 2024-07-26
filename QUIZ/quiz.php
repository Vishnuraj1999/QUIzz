<?php
session_start();
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['name'])) {
    $name = $_POST['name'];
    $stmt = $pdo->prepare("INSERT INTO users (name) VALUES (:name)");
    $stmt->execute(['name' => $name]);
    $_SESSION['user_id'] = $pdo->lastInsertId();
    $_SESSION['question_index'] = 0;
}

if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$question_index = $_SESSION['question_index'];

$stmt = $pdo->prepare("SELECT * FROM questions LIMIT :offset, 1");
$stmt->bindValue(':offset', (int) $question_index, PDO::PARAM_INT);
$stmt->execute();
$question = $stmt->fetch();

if (!$question) {
    header("Location: review.php");
    exit();
}

$question_id = $question['id'];
$question_text = $question['question_text'];

$stmt = $pdo->prepare("SELECT * FROM answers WHERE question_id = :question_id");
$stmt->execute(['question_id' => $question_id]);
$answers = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
   <link href="css/indexstyle.css" rel="stylesheet">
</head>
<body>
    <div class="container text-center">
        <h1 class="mb-4">Quiz</h1>
        <form action="quiz.php" method="POST">
            <p><?php echo htmlspecialchars($question_text); ?></p>
            <?php foreach ($answers as $answer): ?>
                <div class="form-check">
                    <input type="radio" class="form-check-input" name="answer" value="<?php echo $answer['id']; ?>" required>
                    <label class="form-check-label"><?php echo htmlspecialchars($answer['answer_text']); ?></label><br>
                </div>
            <?php endforeach; ?>
            <input type="hidden" name="question_id" value="<?php echo $question_id; ?>">
            <button type="submit" class="btn btn-primary mt-3">Next</button>
        </form>
    </div>
</body>
</html>

<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['answer']) && isset($_POST['question_id'])) {
    $_SESSION['answers'][$_POST['question_id']] = $_POST['answer'];
    $_SESSION['question_index'] += 1;
    header("Location: quiz.php");
    exit();
}
?>
