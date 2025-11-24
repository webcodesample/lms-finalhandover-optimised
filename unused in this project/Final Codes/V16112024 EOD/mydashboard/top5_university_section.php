<div class="col-md-4 col-xl-6 col-xxl-4 gy-5 gy-md-3">
<div class="card h-100">
    <div class="card-body">
    <div>
        <div class="d-flex pb-1 justify-content-between">
            <div class="d-flex">
            <h5 class="mt-2">Top 5 Universities</h5>
            <select class="form-select form-select-sm text-warning fs-9 mx-1 my-0 py-0 border-0 bg-transparent" id="university_performance_by" style="height:25px; width:105px;" onChange="getTop5Universities()">
            <option value="" selected>All Time</option>
            <option value="yearly">This Year</option>
            <option value="monthly">This Month</option>
            <option value="weekly">This Week</option>
            </select>
            </div>
            <a href="../report_management/university_performance_report.php" class="m-2 btn btn-sm btn-subtle-info py-1 px-2 fs-10">View More</a>
        </div>

        <div class="overflow-auto" style="height:135px;">
        <ul class="list-group list-group-flush" id="top5_universities">
        </ul>
        </div>
    </div>
    </div>
</div>
</div>

<script>
$(document).ready(getTop5Universities);
</script>