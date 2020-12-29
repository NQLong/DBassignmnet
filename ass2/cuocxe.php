<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
        body{
            margin: auto;
        }
    </style>
<head>
<?php
  include "header.php";
?>    
<body>
    <h2 class="text-center mb-2">Danh sách cuốc xe</h2>
        <!-- Button trigger modal -->
<button type="button" class="btn btn-primary mb-2" data-bs-toggle="modal" data-bs-target="#addCuocXeModal">
  Tạo cuốc xe mới
</button>
<!-- Modal -->
<div class="modal fade" id="addCuocXeModal" tabindex="-1" aria-labelledby="addCuocXeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addCuocXeModalLabel">Tạo cuốc xe mới</h5>
      </div>
      <div class="modal-body">
      <form action='addCuocXe.php' method='get'>
            <div class="form-group row">
                <label for="text" class="col-sm-4 col-form-label">Ngày đi :</label>
                <div class="col-sm-8">
                    <input type="date" class="form-control" name="NgayDi">
                </div>
            </div>
            <div class="form-group row">
                <label for="text" class="col-sm-4 col-form-label">Ngày đến :</label>
                <div class="col-sm-8">
                    <input type="date" class="form-control" name="NgayDen">
                </div>
            </div>
            <div class="form-group row">
                <label for="text" class="col-sm-4 col-form-label">Phương tiện:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Nhập phương tiện" name="PhuongTien">
                </div>
            </div>
            <?php
                $username = "root";
                $password = "140199";
                $hostname = "localhost"; 
                $db="something";
                $connect = new mysqli($hostname, $username, $password, $db);

                if (!$connect){
                    die("Connection failed: ".  mysqli_connect_error());
                }
                $resulttx = $connect->query("SELECT CMND FROM taixe");
                if ($resulttx->num_rows > 0){
                    echo "<div class='form-group>";
                        echo "<label for='cmndTaiXe'>CMND Tài xế:</label>";
                        echo "<select class='form-control' id='cmndTaiXe' name='cmndTaiXe'>";
                        while($row = $resulttx->fetch_assoc()){
                            echo "<option value=''>$row{'CMND'}</option>";
                        }
                        echo "</select>";
                    echo "</div>";
                }
            ?>
            
            <?php
                $username = "root";
                $password = "140199";
                $hostname = "localhost"; 
                $db="something";
                $connect = new mysqli($hostname, $username, $password, $db);

                if (!$connect){
                    die("Connection failed: ".  mysqli_connect_error());
                }
                $resultlx = $connect->query("SELECT * FROM loxe");
                if ($resultlx->num_rows > 0){
                    echo "<div class='form-group>";
                        echo "<label for='cmndLoXe'>CMND Lơ Xe:</label>";
                        echo "<select class='form-control' id='cmndLoXe' name='cmndLoXe'>";
                        while($row = $resultlx->fetch_assoc()){
                            echo "<option value='$row{'CMND'}'>$row{'CMND'}</option>";
                        }
                        echo "</select>";
                    echo "</div>";
                }
            ?>
            <div class="modal-footer">
                <button type="button btn-primary" class="btn-close" data-bs-dismiss="modal">Close</button>
                <input type="submit" value="Tạo" name="submit" class="btn btn-primary"></input>
            </div>
        </form>
      </div>
    </div>
  </div>
</div>
    <?php
        $username = "root";
        $password = "140199";
        $hostname = "localhost"; 
        $db="something";
        $connect = new mysqli($hostname, $username, $password, $db);

        if (!$connect){
            die("Connection failed: ".  mysqli_connect_error());
        }
        $result = $connect->query("SELECT * FROM cuocxe");
        if ($result->num_rows > 0){
            echo "<table class='table table-hover'>";
            echo "<thead class='thead-dark'>
                <tr>
                    <th>ID</th>
                    <th>Ngày đến</th>
                    <th>Ngày đi</th>
                    <th>Phương tiện</th>
                    <th>Tài xế CMND</th>
                    <th>Lơ xe CMND</th>
                </tr>
                </thead>";
            echo "<tbody>";
            while($row = $result->fetch_assoc()){
                echo "<tr>";
                echo "<td>".$row{'ID'}."</td>";
                echo "<td>".$row{'NgayDen'}."</td>";
                echo "<td>".$row{'NgayDi'}."</td>";
                echo "<td>".$row{'PhuongTien'}."</td>";
                echo "<td>".$row{'TaiXeCMND'}."</td>";
                echo "<td>".$row{'LoXeCMND'}."</td>";
                echo "</tr>";
            }
            echo "</tbody>";
            echo "</table>";
        }
    ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
</body>    
</html>