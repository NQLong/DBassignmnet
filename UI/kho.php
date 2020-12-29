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
    <h2 class="text-center mb-2">Danh sách kho</h2>
        <!-- Button trigger modal -->
<button type="button" class="btn btn-primary mb-2" data-bs-toggle="modal" data-bs-target="#addKhoModal">
  Tạo kho mới
</button>
<!-- Modal -->
<div class="modal fade" id="addKhoModal" tabindex="-1" aria-labelledby="addKhoModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addKhoModalLabel">Tạo kho mới</h5>
      </div>
      <div class="modal-body">
      <form action='addKho.php' method='get'>
            <div class="form-group row">
                <label for="text" class="col-sm-4 col-form-label">Tên kho:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Nhập tên kho" name="Ten">
                </div>
            </div>
            <div class="form-group row">
                <label for="text" class="col-sm-4 col-form-label">Tỉnh:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Nhập tỉnh kho" name="Tinh">
                </div>
            </div>
            <div class="form-group row">
                <label for="text" class="col-sm-4 col-form-label">Địa chỉ:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Nhập địa chỉ kho" name="DiaChi">
                </div>
            </div>
            <div class="form-group row">
                <label for="number" class="col-sm-4 col-form-label">Diện tích:</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" placeholder="Nhập diện tích kho" name="DienTich">
                </div>
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
<button type="button" class="btn btn-secondary mb-2" data-bs-toggle="modal" data-bs-target="#capnhatKhoModal">
  Cập nhật kho
</button>
<!-- Modal -->
<div class="modal fade" id="capnhatKhoModal" tabindex="-1" aria-labelledby="capnhatKhoModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="capnhatKhoModal">Cập nhật kho</h5>
      </div>
      <div class="modal-body">
      <form action='capnhatKho.php' method='get'>
            <div class="form-group row">
                <label for="number" class="col-sm-4 col-form-label">ID kho:</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" placeholder="Cập nhật ID kho" name="ID">
                </div>
            </div>
            <div class="form-group row">
                <label for="text" class="col-sm-4 col-form-label">Tên kho:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Nhập tên kho" name="Ten">
                </div>
            </div>
            <div class="form-group row">
                <label for="text" class="col-sm-4 col-form-label">Tỉnh:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Nhập tỉnh kho" name="Tinh">
                </div>
            </div>
            <div class="form-group row">
                <label for="text" class="col-sm-4 col-form-label">Địa chỉ:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Nhập địa chỉ kho" name="DiaChi">
                </div>
            </div>
            <div class="form-group row">
                <label for="number" class="col-sm-4 col-form-label">Diện tích:</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" placeholder="Nhập diện tích kho" name="DienTich">
                </div>
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
        $result = $connect->query("SELECT * FROM kho");
        if ($result->num_rows > 0){
            echo "<table class='table table-hover'>";
            echo "<thead class='thead-dark'>
                <tr>
                    <th>ID</th>
                    <th>Tên car</th>
                    <th>Diện tích</th>
                    <th>Địa chỉ</th>
                    <th>Tỉnh</th>
                </tr>
                </thead>";
            echo "<tbody>";
            while($row = $result->fetch_assoc()){
                echo "<tr>";
                echo "<td>".$row{'ID'}."</td>";
                echo "<td>".$row{'Ten'}."</td>";
                echo "<td>".$row{'DienTich'}."</td>";
                echo "<td>".$row{'DiaChi'}."</td>";
                echo "<td>".$row{'Tinh'}."</td>";
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