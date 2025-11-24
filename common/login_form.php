<div class="row flex-center h-100 g-0 px-4 px-sm-0">
    <div class="col col-sm-6 col-lg-7 col-xl-6">
        <a class="d-flex flex-center text-decoration-none mb-4" href="../../../index.html">
            <div class="d-flex align-items-center fw-bolder fs-3 d-inline-block">
                <img src="../images/lms-logo.png" alt="phoenix" height="45" />
            </div>
        </a>
        <div id="alertMessage" class="text-center mb-5 px-5">
            <?=$msg?>
        </div>
        <form method="post">
        <div class="mb-3 text-start">
            <label class="form-label" for="email">User id</label>
            <div class="form-icon-container">
                <input class="form-control form-icon-input" id="userid" name="userid" type="text" placeholder="User ID" required/><span class="fas fa-user text-body fs-9 form-icon"></span>
            </div>
        </div>
        <div class="mb-3 text-start">
            <label class="form-label" for="password">Password</label>
            <div class="form-icon-container">
                <input class="form-control form-icon-input" id="password" name="password" type="password" placeholder="Password" required/><span class="fas fa-key text-body fs-9 form-icon"></span>
            </div>
        </div>
        <div class="row flex-between-center mb-7">
            <div class="col-auto">
                <div class="form-check mb-0">
                    <input class="form-check-input" id="basic-checkbox" type="checkbox" checked="checked" />
                    <label class="form-check-label mb-0" for="basic-checkbox">Remember me</label>
                </div>
            </div>
            <div class="col-auto"><a class="fs-9 fw-semibold" href="forgot_password_form.php">Forgot Password?</a></div>
        </div>
        <button type="submit" class="btn btn-primary w-100 mb-3">Sign In</button>
        <input type="hidden" name="action_perform" value="login">
        </form>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        setTimeout(changeAlertMsg, 5000); // 1000 milliseconds = 1 seconds
    });

    function changeAlertMsg()
    {
        $("#alertMessage").html("<h5 class='alert alert-subtle-primary py-3'>Get Access Your Account</h5>");
    }
</script>