<nav class="navbar navbar-vertical navbar-expand-lg">
<div class="collapse navbar-collapse" id="navbarVerticalCollapse">
    <!-- scrollbar removed-->
    <div class="navbar-vertical-content">
    <ul class="navbar-nav flex-column" id="navbarVerticalNav">
        <li class="nav-item">
        <!-- label-->
        <p class="navbar-vertical-label">Apps</p>
        <hr class="navbar-vertical-line" />

        <?=addMenuItemDashboard(); ?>
        <?php generateSidebarMenu($con); ?>

        </li>
    </ul>
    </div>
</div>
<div class="navbar-vertical-footer">
    <button class="btn navbar-vertical-toggle border-0 fw-semibold w-100 white-space-nowrap d-flex align-items-center"><span class="uil uil-left-arrow-to-left fs-8"></span><span class="uil uil-arrow-from-right fs-8"></span><span class="navbar-vertical-footer-text ms-2">Collapsed View</span></button>
</div>
</nav>