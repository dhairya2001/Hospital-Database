<?php
session_start();
include_once("helpers/db.php");
if(!isset($_SESSION['username'])){
        header("Location: login.php");
     }
$page_title = "Update Doctor";
include("inc/header.php");
?>
<link rel="stylesheet" href="assets/css/custom.css">
</head>
<body class="text-center">
<?php include("inc/menu.php"); ?>
<?  

    if(isset($_POST['update'])){
        include_once("helpers/db.php");

        $id=$_POST['doc_id'];
        $name = $_POST['fullname'];
        $dept = $_POST['department'];
        $phone = $_POST['phone'];
        $work_time = $_POST['worktime'];

        $query = " UPDATE `doctor` SET `name`='$name',`work_time`='$work_time',`phone_number`='$phone',`department_id`='$dept' WHERE `id =$id";

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
              <label for="doc_id">Enter ID</label>
              <input type="text" name="doc_id" id="doc_id" class="form-control" required>

              <label for="fullname">Fullname</label>
              <input type="text" name="fullname" id="fullname" class="form-control" required>

              <label for="department">Department</label>
              <select name="department" id="department" class="form-control p-2">
                  <?php
                    $dept_query = "SELECT * from department";
                    $query_run = mysqli_query($con,$dept_query);
                    while($dept_data = mysqli_fetch_array($query_run)){
                        ?>
                        <option value="<?php echo $dept_data['id']?>"><?php echo $dept_data['name']?></option>
                        <?php
                    }
                  ?>
              </select>

              <label for="worktime">Work time</label>
              <input type="text" name="worktime" id="worktime" class="form-control" required>

              <label for="phone">Phone Number</label>
              <input type="text" name="phone" id="phone" class="form-control" required maxlength="10" pattern="[1-9]{1}[0-9]{9}"><br>
              <input type="submit" class="btn btn-primary" name="update" value="update">
      </div>
          </form>
<?php
include_once("inc/bootstrap.php");
include_once("inc/footer.php");
?>
