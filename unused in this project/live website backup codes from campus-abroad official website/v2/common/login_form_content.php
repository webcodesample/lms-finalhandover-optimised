    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
        <div class="row vh-100 g-0">
            <div class="col-lg-6 position-relative d-none d-lg-block">
                <div class="bg-holder" style="background-image:url(../images/login_page_left_pane_bg.jpg);">
                </div>
                <!--/.bg-holder-->

            </div>
            <div class="col-lg-6">
                <div class="row flex-center h-100 g-0 px-4 px-sm-0">
                    <div class="col col-sm-6 col-lg-7 col-xl-6">
                        <a class="d-flex flex-center text-decoration-none mb-4" href="../../../index.html">
                            <div class="d-flex align-items-center fw-bolder fs-3 d-inline-block">
                                <img src="../images/ca-logo.png" alt="phoenix" height="58" />
                            </div>
                        </a>
                        <div class="text-center mb-7">
                            <h3 class="text-body-highlight">Sign In</h3>
                            <p class="text-body-tertiary">Get access to your account</p>
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
            </div>
        </div>
        <script>
        var navbarTopStyle = window.config.config.phoenixNavbarTopStyle;
        var navbarTop = document.querySelector('.navbar-top');
        if (navbarTopStyle === 'darker') {
          navbarTop.setAttribute('data-navbar-appearance', 'darker');
        }

        var navbarVerticalStyle = window.config.config.phoenixNavbarVerticalStyle;
        var navbarVertical = document.querySelector('.navbar-vertical');
        if (navbarVertical && navbarVerticalStyle === 'darker') {
          navbarVertical.setAttribute('data-navbar-appearance', 'darker');
        }
        </script>
        <?php include_once("../common/chat_demo.php") ?>
    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->



<?php include_once("../common/customisation_panel.php") ?>
<?php include_once("../common/footer_copyright.php") ?>
