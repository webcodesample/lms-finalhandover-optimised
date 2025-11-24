<div class="d-flex justify-content-between px-5 bg-light w-100 fixed-top">
<h5 class="m-3 text-uppercase"><?=$company_name?></h5>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav nav nav-underline me-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link <?=$aboutus_link_active?>" href="?">About US</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link <?=$services_link_active?>" href="?page=services">Services</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link <?=$contactus_link_active?>" href="?page=contact">Contact US</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link <?=$joinus_link_active?>" href="?page=join">Join US</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

</div>

