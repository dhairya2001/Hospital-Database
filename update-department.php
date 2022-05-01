<?php
session_start();
include_once("helpers/db.php");
if(!isset($_SESSION['username'])){
        header("Location: login.php");
     }
$page_title = "Update Department";
include("inc/header.php");
?>
<link rel="stylesheet" href="assets/css/custom.css">
</head>
<body class="text-center">
<?php include("inc/menu.php"); ?>
<?  

    if(isset($_POST['update'])){
        include_once("helpers/db.php");

        $dept = $_POST['dept'];
        $id= $_POST['dept_id'];
        $query = "UPDATE `department` SET `name`='$dept' WHERE `id`=`$id`";

        mysql_select_db('healthcare');
        if(!mysqli_query($con,$query)){
            $msg="Some error occured!";
        }else{
            ?>
            <form class="form-signin" method="post">
      <h1 class="h3 mb-3 font-weight-normal"><?php echo $page_title;?></h1>
      <?php
            if(isset($msg)){
               echo "<div class='alert alert-warning' role='alert'>".$msg."</div>";
            }
      ?>
      <div class="form-control">
              <label for="dept_id">Enter Department ID</label>
              <input type="text" name="dept_id" id="dept_id" class="form-control" required><br>
              <label for="dept">Department name</label>
              <input type="text" name="dept" id="dept" class="form-control" required><br>
              <input type="submit" class="btn btn-primary" name="update" value="update">
      </div>
          </form>
<?php
include_once("inc/bootstrap.php");
include_once("inc/footer.php");
?>
