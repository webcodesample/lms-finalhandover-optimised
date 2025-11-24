    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <div class="row vh-100 g-0">
        <div class="col-lg-6 position-relative d-none d-lg-block">
          <div class="bg-holder" style="background-image:url(../assets/img/bg/34.png);">
          </div>
          <!--/.bg-holder-->

        </div>
        <div class="col-lg-6">
          <div class="row flex-center h-100 g-0 px-4 px-sm-0">
            <div class="col col-sm-6 col-lg-7 col-xl-6"><a class="d-flex flex-center text-decoration-none mb-4" href="../../../index.html">
                <div class="d-flex align-items-center fw-bolder fs-3 d-inline-block"><img src="../images/ca-logo.png" alt="phoenix" height="58" />
                </div>
              </a>
              <div class="text-center">
                <h4 class="text-body-highlight">Forgot your password?</h4>
                <p class="text-body-tertiary mb-5">Enter your email below and we will send <br class="d-xxl-none" />you a reset link</p>
                <form class="d-flex align-items-center mb-5" action="forgot_password.php" method="post">
                  <input class="form-control flex-1" id="email" name="email" type="email" placeholder="Email" required/>
                  <button type="submit" class="btn btn-primary ms-2">Send<span class="fas fa-chevron-right ms-2"></span></button>
                  <input type="hidden" name="action_perform" value="forgot_password">
                </form><a class="fs-9 fw-bold" href="#!">Still having problems?</a>
              </div>
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
