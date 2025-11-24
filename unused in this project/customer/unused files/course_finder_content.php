<div class="position-fixed top-20 end-0 translate-middle-y" style="margin-top:100px; margin-right:-45px;">
<button class="btn btn-subtle-danger fs-8 py-3" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions" style="rotate: 270deg;">
<span class="uil uil-search fs-8 me-2"></span>Search
</button>
</div>

<div class="offcanvas offcanvas-end bg-secondary-subtle" id="offcanvasWithBothOptions" data-bs-scroll="true" tabindex="-1" aria-labelledby="offcanvasWithBothOptionsLabel" style="width:260px;">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title ps-4" id="offcanvasWithBothOptionsLabel">Search Filters</h5>
    <button class="btn-close btn-sm text-reset fw-bold fs-10" type="button" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <?php include_once("course_finder_search_form.php") ?>
  </div>
</div>

<div>
<?php include_once("course_finder_search_result.php") ?>
</div>

<?php include_once("footer_copyright.php") ?>