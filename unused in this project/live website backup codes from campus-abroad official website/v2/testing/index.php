<?php
include_once("../pub/common_include.php");
include_once("head.php");
?>
        <center>
            <div class="container mt-5">
                <form method="post" action="login.php">
                    <select name="role" class="form-select form-select-sm m-1" required style="width:200px;">
                    <option value="">Role</option>
                    <option value="1">Client</option>
                    <option value="2">Developer</option>
                    <option value="3">Tester</option>
                    </select>
                    <input type="text" name="username" class="form-control form-control-sm m-1" placeholder="Username" required style="width: 200px;">
                    <input type="password" name="password" class="form-control form-control-sm m-1" placeholder="Password" required style="width: 200px;">
                    <button type="submit" class="btn btn-sm btn-success m-1">Login</button>
                </form>
            </div>
        </center>