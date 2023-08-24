
<?php

//load.php

$connect = new PDO('mysql:host=localhost;dbname=course', 'root', '');

$data = array();

$query = "SELECT * FROM events ORDER BY id";

$statement = $connect->prepare($query);

$statement->execute();

$result = $statement->fetchAll();

foreach($result as $row)
{
    
 $data[] = array(
  'id'   => $row["id"],
  'title'   => $row["title"],
  'start'   => $row["start_event"],
  'end'   => $row["end_event"]
 );
}

$student_id = 2;
$query2 = "SELECT * FROM attendance  WHERE student_id = $student_id ORDER BY id";

$statement = $connect->prepare($query2);

$statement->execute();

$result = $statement->fetchAll();

foreach($result as $row)
{
    
 $data[] = array(
  'id'   => $row["id"],
  'title'   => $row["title"],
  'start'   => $row["start_event"],
  'end'   => $row["end_event"]
 );
}
echo json_encode($data);

?>
