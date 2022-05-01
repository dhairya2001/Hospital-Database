<?php
session_start();
include_once("helpers/db.php");
if(!isset($_SESSION['username'])){
        header("Location: login.php");
     }
$page_title = "Update Patient";
include("inc/header.php");
?>
<link rel="stylesheet" href="assets/css/custom.css">
</head>
<body class="text-center">
<?php include("inc/menu.php"); ?>
<?php

    if(isset($_POST['update'])){
        include_once("helpers/db.php");

        $number = $_POST['number'];
        $type = $_POST['type'];
        $rent = $_POST['rent'];
        $query = "UPDATE `healthcare`.`room` SET `type`='$type',`rent`='$rent' WHERE `number`=`$number`";

        
        if(!mysqli_query($con,$query)){
            $msg="Some error occured!";
            }
        }else{
            ?>
            <form class="form-signin text-center" method="post">

            <h1 class="h3 mb-3 font-weight-normal"><?php echo $page_title;?></h1>
            <?php
                if(isset($msg)){
                    echo "<div class='alert alert-warning' role='alert'>".$msg."</div>";
                }
            ?>
            <div class="form-control">
                    <label for="number">Room no.</label>
                    <input type="text" name="number" id="number" class="form-control" required autofocus>

                    <label for="">Room type</label>
                    <select class="form-control p-2" name="type">
                    <option value="1">General Ward</option>
                    <option value="2">ICU</option>
                    <option value="3">Emergency</option>
                    
            </select>
                <label for="rent">Rent</label>
                    <input type="text" name="rent" id="rent" class="form-control" required>
                <br>
                    <input type="submit" class="btn btn-primary" name="update" value="update">
            </div>
                </form>
                <?php
            }
        ?>
<?php
include_once("inc/bootstrap.php");
include_once("inc/footer.php");
?>
