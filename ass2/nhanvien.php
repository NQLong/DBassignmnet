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
    <h2 class="text-center mb-2">Danh sách nhân viên</h2>
        <!-- Button trigger modal -->
<button type="button" class="btn btn-primary mb-2" data-bs-toggle="modal" data-bs-target="#addNhanVienModal">
  Tạo nhân viên mới
</button>
<!-- Modal -->
<div class="modal fade" id="addNhanVienModal" tabindex="-1" aria-labelledby="addNhanVienModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addNhanVienModalLabel">Tạo nhân viên mới</h5>
      </div>
      <div class="modal-body">
      <form action='addNhanVien.php' method='get'>
            <div class="form-group row">
                <label for="text" class="col-sm-3 col-form-label">CMND :</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="CMND">
                </div>
            </div>
            <div class="form-group row">
                <label for="text" class="col-sm-3 col-form-label">Ngày tuyển dụng :</label>
                <div class="col-sm-8">
                    <input type="date" class="form-control" name="NgayTuyendung">
                </div>
            </div>
            <div class="form-group row">
                <label for="text" class="col-sm-3 col-form-label">Địa chỉ:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Nhập địa chỉ" name="DiaChi">
                </div>
            </div>
            <div class="form-group row">
                <label for="text" class="col-sm-3 col-form-label">Họ:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Nhập họ" name="Ho">
                </div>
            </div>
            <div class="form-group row">
                <label for="text" class="col-sm-3 col-form-label">Tên:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Nhập tên" name="Ten">
                </div>
            </div> 
            <div class="form-group">
                <label for="chucvu">Chức vụ:</label>
                <select class="form-control" id="chucvu" name="chucvu">
                <option value="1">Tài xế</option>
                <option value="2">Lơ xe</option>
                <option value="3">Người quản lý</option>
                </select>
            </div>
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
        $result = $connect->query("SELECT * FROM nhanvien");
        if ($result->num_rows > 0){
            echo "<table class='table table-hover'>";
            echo "<thead class='thead-dark'>
                <tr>
                    <th>CMND</th>
                    <th>Ngày tuyển dụng</th>
                    <th>Địa chỉ</th>
                    <th>Họ</th>
                    <th>Tên</th>
                </tr>
                </thead>";
            echo "<tbody>";
            while($row = $result->fetch_assoc()){
                echo "<tr>";
                echo "<td>".$row{'CMND'}."</td>";
                echo "<td>".$row{'NgayTuyendung'}."</td>";
                echo "<td>".$row{'DiaChi'}."</td>";
                echo "<td>".$row{'Ho'}."</td>";
                echo "<td>".$row{'Ten'}."</td>";
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